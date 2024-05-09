//
//  FinalPageView.swift
//  swiftQuizApp
//
//  Created by StudentAM on 5/6/24.
//

import SwiftUI

struct FinalPageView: View {
    
    //this stores user's final score once quiz finished
    @State var finalScore: Int
    
    var body: some View {
        ZStack{
            //this is the image used for background of quiz
            Image("brainrotQuiz")
            //same properties as the other files to make sure the background stays and looks consistent
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                //this displays great job for user to see for finishing quiz
                Text("Great Job")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .frame(width: 220, height: 65)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(25)
                //this uses text interpolaton to display their final score after going through entire quiz
                Text("You got \(finalScore)")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .frame(width: 190, height: 65)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(25)
            }
        }

    }
}

#Preview {
    //this parameter takes the score from the previous file and updates it into this file for user's final score
    FinalPageView(finalScore: 0)
}
