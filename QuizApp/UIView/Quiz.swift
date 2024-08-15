//
//  Quiz.swift
//  QuizApp
//
//  Created by Md Omar Faruq on 14/8/24.
//

import SwiftUI

struct Quiz: View {
    var body: some View {
        ZStack {
            Color.bg
           .ignoresSafeArea()
            VStack {
              //  Color.black
            Text("2:30")
            .foregroundStyle(Color(hex: 0xFFFFFF))
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
                    Text("What is the name of this card in the JRF?")
                }
                .padding(.bottom,190)
            }
            .cornerRadius(20)
            .padding(.top,40)
            .padding()
        }
       
        
       
    }
}

#Preview {
    Quiz()
}
