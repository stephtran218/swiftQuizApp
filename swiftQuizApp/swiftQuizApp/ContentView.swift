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
                //this image is used as the background of the app
                Image("brainrotQuiz")
                //this changes size so it doesn't automatically zoom in
                    .resizable()
                //this scales it so it fully fits the scrren
                    .scaledToFill()
                //this stretches out the image from edge to edge so there is no border present
                    .ignoresSafeArea()
                VStack{
                    //this displays name of quiz
                    Text("Brainrot Quiz")
                        .foregroundColor(.white)
                        .font(.system(size: 48))
                        .frame(width: 320, height: 90)
                        .background(Color.red)
                        .cornerRadius(15.0)
                        .padding()
                    //this takes the user to the quiz page using the button begin
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
