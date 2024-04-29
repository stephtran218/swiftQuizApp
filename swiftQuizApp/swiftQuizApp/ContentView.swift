//
//  ContentView.swift
//  swiftQuizApp
//
//  Created by StudentAM on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("brainrotQuiz")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Text("Brainrot Quiz")
                        .foregroundColor(.white)
                        .font(.system(size: 48))
                        .frame(width: 310, height: 90)
                        .background(Color.red)
                        .cornerRadius(15.0)
                        .padding()
                    NavigationLink(destination: QuestionsPageView().navigationBarBackButtonHidden(true), label: {
                        Text("Begin")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .frame(width: 120, height: 65)
                            .background(Color.red)
                            .cornerRadius(15.0)
                            .padding(25)

                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
