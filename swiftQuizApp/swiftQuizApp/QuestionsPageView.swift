//
//  QuestionsPageView.swift
//  swiftQuizApp
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI


struct QuestionsPageView: View {
    
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: String = ""
    @State private var correct: Bool = false
    @Binding var score: Int
    
    var questionsArray: [Question] = [
        Question(questions: "A bleach and _?", options: ["Perm", "Buzz", "Tone", "Blonde"], correctAnswer: "Tone"),
        Question(questions: "Finish the phrase. “The Nile is a river in Egypt..”", options: ["YOUR HUSBAND IS GAY", "DO A SOLO", "Oh?", "All the above"], correctAnswer: "YOUR HUSBAND IS GAY"),
        Question(questions: "Who says “Nina. Nina. NINA!”", options: ["Fish girl", "Trisha Paytas", "Austin McBroom", "Debby Ryan"], correctAnswer: "Fish girl"),
        Question(questions: "Who says “I was supposed to be in the video”", options: ["Kendall Vertes", "Madison Beer", "Debby Ryan", "Jojo Siwa"], correctAnswer: "Madison Beer"),
        Question(questions: "What song was played during the TikTok Rizz Party?", options: ["CARNIVAL", "FEIN!", "SICKO MODE", "MELTDOWN (feat. Drake)"], correctAnswer: "CARNIVAL"),
        Question(questions: "Who said “HELLO DUBAI”", options: ["Beyonce", "Rihanna", "Jennifer Lopez", "Kim Kardashian"], correctAnswer: "Rihanna"),
        Question(questions: "Who said “I finna be in the pit.”", options: ["Charli D'amelio", "Trisha Paytas", "Tana Mongeau", "Taraswrld"], correctAnswer: "Taraswrld"),
        Question(questions: "Finish the phrase. “Clap if you ever been to a fat farm”", options: ["Oh that's not-", "A few you fatties", "In the sense that-", "What the sigma?"], correctAnswer: "A few you fatties"),
        Question(questions: "Who is Flashback Mary?", options: ["Wendy Williams", "Trisha Paytas", "James Charles", "Tana Mongeau"], correctAnswer: "James Charles"),
        Question(questions: "Who said “Then you should probably eat.”" , options: ["Olivia Rodrigo", "Selena Gomez", "Shailene Woodley", "Debby Ryan"], correctAnswer: "Shailene Woodley")
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("brainrotQuiz")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack{
                    Text("Score: \(score)")
                        .frame(width: 120, height: 45)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background(Color.white)
                        .padding()
                    if currentQuestionIndex < questionsArray.count {
                        VStack {
                            Text(questionsArray[currentQuestionIndex].questions)
                                .foregroundColor(.black)
                                .frame(width: 270, height: 120)
                                .padding(.horizontal, 10)
                                .background(Color.white)
                                .font(.system(size: 25))
                                .padding(.bottom,30)
                            ForEach(questionsArray[currentQuestionIndex].options.indices, id: \.self) { j in
                                Button(action: {
                                    checkAnswer(selectedOption: questionsArray[currentQuestionIndex].options[j])
                                }) {
                                    Text(questionsArray[currentQuestionIndex].options[j])
                                        .frame(width: 260, height: 80)
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                }
                            }
                            NavigationLink(destination: FinalPageView(score: $score), label: {
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
    }
    
    func checkAnswer(selectedOption: String) {
        if selectedOption == questionsArray[currentQuestionIndex].correctAnswer{
            correct = true
            score += 1
            currentQuestionIndex += 1
        }
    }
}

struct QuestionsPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsPageView()
    }
}
