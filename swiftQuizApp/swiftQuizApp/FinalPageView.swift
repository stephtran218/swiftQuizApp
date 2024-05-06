//
//  FinalPageView.swift
//  swiftQuizApp
//
//  Created by StudentAM on 5/6/24.
//

import SwiftUI

struct FinalPageView: View {
    
    @Binding var score: Int
    
    var body: some View {
        ZStack{
            Image("brainrotQuiz")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Text("Great Job")
                Text("You got \(score)")
            }
        }

    }
}

#Preview {
    FinalPageView(score: $score)
}
