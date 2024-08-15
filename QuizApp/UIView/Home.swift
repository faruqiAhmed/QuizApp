//
//  Home.swift
//  QuizApp
//
//  Created by Md Omar Faruq on 14/8/24.
//

import SwiftUI
struct Home: View {
    var body: some View {
        ZStack {
            Color.bg
           .ignoresSafeArea()
            VStack {
                Header()
            }
            .padding(.bottom,720)
                ContentsView()
            VStack(alignment: .leading,spacing: 16) {
                Text("JRF Sunday’s")
                    .padding(.leading,-95)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                Text("Supper Quiz")
                    .padding(.leading,-95)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                Text("Play Super Quiz & earn 500 coin")
                    .padding(.leading,-90)
                    
            }
            .padding(.bottom,140)
            .foregroundStyle(Color(hex: 0xFFFFFF))
            
        }
       
        VStack {
            Color.white
            VStack(alignment: .leading,spacing: 16) {
                Color.white
                Text("Tosay’s Quiz on")
                    .padding(.top)
                    .fontWeight(.none)
                    .foregroundStyle(Color(hex: 0x1A1D24))
                    .font(.system(size: 18))
                Text("General Knowledge")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundStyle(Color("bg"))
                Text("The Quiz ends in")
                    .font(.system(size: 18))
                    .foregroundStyle(Color("TextColor"))
            }
            
            .padding(.leading,12)
           TimerView()
                .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .bottom)
              //  .padding()
            VStack {
                Button {
                    
                 //   viewModel.signInWithEmail()
                } label: {
                    Text("Play Quiz Now")
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
        }
        .padding(.bottom)
        .background(RoundedRectangle(cornerRadius: 40).fill(Color.white))
     //   .presentationCornerRadius(40)
        .frame(maxWidth: .infinity , maxHeight: 20, alignment: .bottom)
       
    }
   
       
}

#Preview {
    Home()
}
struct TimerView: View {
    var body: some View {
      VStack(){
            HStack (spacing: 10) {
                VStack {
                   Text("2")
                    Text("hour")
                    
                }
                .frame(maxWidth: .infinity,maxHeight: 70)
                .background(Color.set)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.gray, lineWidth: 1)
                )
                Spacer()
                VStack {
                    Text("30")
                    Text("Minute")
                }
                .padding()
              
                .frame(maxWidth: .infinity,maxHeight: 70)
                .background(Color.set)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.gray, lineWidth: 1)
                    )
               Spacer()
                VStack {
                   Text("50")
                   Text("Seconds")
                }
            
                .frame(maxWidth: .infinity,maxHeight: 70)
                .background(Color.set)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.gray, lineWidth: 1)
                    )
            }
            .padding()
            
        }
    }
}



struct ContentsView: View {
    var body: some View {
        VStack {
            Image("Conten")
                 .padding(.trailing,-200)
                 .padding(.bottom,500)
        }
        
        VStack (){
            Image("Score")
            .padding(.leading,-170)
            .padding(.bottom,480)
            
        }
    }
}

struct Header: View {
    var body: some View {
        
            HStack {
                VStack {
                    Image("menu")
                       
                }
                .padding()
                .padding(.trailing,250)
                VStack {
                    Image("notic")
                       
                }
                .padding()
                .padding(.leading,20)
               
            }
            
    }
}

