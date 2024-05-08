//
//  FinalPageView.swift
//  swiftQuizApp
//
//  Created by StudentAM on 5/6/24.
//

import SwiftUI

struct FinalPageView: View {
    
    @State var finalScore: Int
    
    var body: some View {
        ZStack{
            Image("brainrotQuiz")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Text("Great Job")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .frame(width: 220, height: 65)
                    .background(Color.red)
                    .cornerRadius(15.0)
                    .padding(25)
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
    FinalPageView(finalScore: 0)
}
