//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Md Omar Faruq on 15/8/24.
//

import Foundation
import SwiftUI

class QuizViewModel : ObservableObject {

    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model =  QuizViewModel.createGameModel(i:  QuizViewModel.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (QuizViewModel.currentIndex < 2) {
                        QuizViewModel.currentIndex = QuizViewModel.currentIndex + 1
                        self.model = QuizViewModel.createGameModel(i: QuizViewModel.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
    }
    
    func restartGame() {
        QuizViewModel.currentIndex = 0
        model = QuizViewModel.createGameModel(i: QuizViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
    
                                     
                                     
                                     
                                

}

extension QuizViewModel
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Do you want to check CHECK24?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "1997", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "B", option: "1999", color: Color.red),
                                    QuizOption(id: 13,optionId: "C", option: "2001", color: Color.green),
                                    QuizOption(id: 14,optionId: "D", option: "2004", color: Color.purple)]),
            QuizModel(question: "Which is the fastest animal in the world?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "Turtle", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "B", option: "Cheetah", color: Color.red),
                                    QuizOption(id: 13,optionId: "C", option: "Rabbit", color: Color.green),
                                    QuizOption(id: 14,optionId: "D", option: "Leoprd", color: Color.purple)]),
            
            QuizModel(question: "Which of these animals swims in upright position?",
                      answer: "C",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "Sea Lion", color: Color.yellow),
                                    QuizOption(id: 22,optionId: "B", option: "Sea Urchin", color: Color.red),
                                    QuizOption(id: 23,optionId: "C", option: "Seahorse", color: Color.green),
                                    QuizOption(id: 24,optionId: "D", option: "Sea slug", color: Color.purple)]),
            
            QuizModel(question: "Which is the world largest living fish?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Manta Ray", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "Whale Shark", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "Marlin", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "Sailfish", color: Color.purple)])
        ]
    }
}
