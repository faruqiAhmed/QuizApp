//
//  Quiz.swift
//  QuizApp
//
//  Created by Md Omar Faruq on 14/8/24.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject private var vm = ViewModel()
    @ObservedObject var quizViewModel: QuizViewModel
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
    var body: some View {
        ZStack {
            Color.bg
           .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image ("left")
                            .padding(.leading,-150)
                    }
                    Image ("timer")
                    Text("\(vm.time)")
                }
                
              //  Color.black
                
            .foregroundStyle(Color(hex: 0xFFFFFF))
            }
            .onReceive(timer) { time in
                vm.updateCountdown()
            }
          //  .frame(height: 40)
            .padding(.bottom,720)
            ZStack {
                Color.white
                VStack {
                    HStack {
                        VStack {
                            Text("Question 2/20")
                               
                        }
                        .padding()
                        .padding(.trailing,16)
                        HStack() {
                            VStack {
                                Text("50")
                            }
                            .padding(.leading,-60)
                            VStack {
                                Image("coin")
                            .padding(.leading,-40)
                            }
                        }
                       
                        .padding(.leading,180)
                    }
                    .padding(.bottom,600)
                   
                }
                VStack {
                    Image("Jrfcard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 234, height: 149)
                }
               
                .padding(.bottom,390)
                
                VStack {
                    Text("\(quizViewModel.model.quizModel.question)")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }
                .padding(.bottom,150)
                VStack {
                    ProgressTView(quizViewModel: QuizViewModel())
                   // TimeProgressView()
                    

                }
                .padding(.bottom,40)
                .padding(.trailing,30)
                
                VStack {
                    OptionsGridView(quizViewModel: quizViewModel )
                }
                .padding(.top,250)
                VStack {
                    Button {
                       
                    } label: {
                        Text("Next")
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("ButtonColor"))
                            }
                    }
                    .padding()
                }

                .padding(.top,590)
            }
            .cornerRadius(20)
            .padding(.top,40)
            .padding()
        }
       
        
       
    }
}

#Preview {
    QuizView(quizViewModel: QuizViewModel())
}

struct ProgressTView: View {
    let workoutDateRange = Date()...Date().addingTimeInterval(9)
    var quizViewModel: QuizViewModel

    var body: some View {
        HStack {
            VStack {
            Text("Time:")
            }
            .padding(.bottom,22)
            .padding(.leading,20)
            VStack {
                ProgressView(timerInterval:workoutDateRange) {
                    
                }
                
//                .trim(from: 0.0, to: min(CGFloat((Double(.progress) * Double(quizViewModel.maxProgress))/100),1.0))
//                .controlSize(.large)
//                .frame(height: 100)
              
                .tint(.bg)
               
            }
            VStack {
            Text("\(timerInterval: workoutDateRange)")
            }
            .padding(.trailing,4)
            .padding(.bottom,20)
        }
         
    }
}


struct  OptionsGridView: View {
    var quizViewModel: QuizViewModel
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(305), spacing: 0), count: 1)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(quizViewModel.model.quizModel.optionsList) { quizOption in
                    OptionCardView(quizOption: quizOption)
                        .onTapGesture {
                            quizViewModel.verifyAnswer(selectedOption: quizOption)
                        }
                }
            }
        }
    }
}


struct OptionCardView : View {
    var quizOption: QuizOption
    var body: some View {
        ZStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
               // OptionStatusImageView(imageName: "checkmark")
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
               // setBackgroundColor()
               // OptionStatusImageView(imageName: "xmark")
            } else {
                OptionView(quizOption: quizOption)
            }
            
        }
        .frame(width: 300, height: 49)
            .background(setBackgroundColor())
            .cornerRadius(40)
        .overlay( /// apply a rounded border
                          RoundedRectangle(cornerRadius: 20)
                               .stroke(.gray, lineWidth: 1)
                        )
        
//        .background(setBackgroundColor())
    }
    
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
           
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct OptionView: View {
    var quizOption: QuizOption
    var body: some View {
        ZStack{
            Text(quizOption.optionId)
                .padding(.leading,-130)
        //       .font(.system(size: 30, weight: .bold, design: .rounded))
//                .frame(width: 50, height: 50)
//                .background(quizOption.color.opacity(0.8))
//                .foregroundColor(.white)
//                .cornerRadius(25)
            
            Text(quizOption.option)
                .frame(width: 300, height: 49)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

