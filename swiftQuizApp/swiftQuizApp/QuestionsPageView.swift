//
//  QuestionsPageView.swift
//  swiftQuizApp
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI


struct QuestionsPageView: View {
    
    //this var keeps track of queston index the user is on
    @State private var currentQuestionIndex = 0
    //this var holds the answer choice the user picked to check later
    @State private var selectedOption: String = ""
    //this bool is used to check if user is right or wrong
    @State private var correct: Bool = false
    //this var tracks how many they got right
    @State var currentScore: Int = 0
    //this checks if the quiz is finished or not
    @State private var quizCompleted: Bool = false
    
    //this array holds both the question, options, and the correct answer
    var questionsArray: [Question] = [
        Question(questions: "1. A bleach and _?", options: ["Perm", "Buzz", "Tone", "Blonde"], correctAnswer: "Tone"),
        Question(questions: "2. Finish the phrase. “The Nile is a river in Egypt..”", options: ["YOUR HUSBAND IS GAY", "DO A SOLO", "Oh?", "All the above"], correctAnswer: "YOUR HUSBAND IS GAY"),
        Question(questions: "3. Who says “Nina. Nina. NINA!”", options: ["Fish girl", "Trisha Paytas", "Austin McBroom", "Debby Ryan"], correctAnswer: "Fish girl"),
        Question(questions: "4. Who said “I was supposed to be in the video”", options: ["Kendall Vertes", "Madison Beer", "Debby Ryan", "Jojo Siwa"], correctAnswer: "Madison Beer"),
        Question(questions: "5. What song was played during the TikTok Rizz Party?", options: ["CARNIVAL", "FEIN!", "SICKO MODE", "MELTDOWN (feat. Drake)"], correctAnswer: "CARNIVAL"),
        Question(questions: "6. Who said “HELLO DUBAI”", options: ["Beyonce", "Rihanna", "Jennifer Lopez", "Kim Kardashian"], correctAnswer: "Rihanna"),
        Question(questions: "7. Who said “I finna be in the pit.”", options: ["Charli D'amelio", "Trisha Paytas", "Tana Mongeau", "Taraswrld"], correctAnswer: "Taraswrld"),
        Question(questions: "8. Finish the phrase. “Clap if you ever been to a fat farm”", options: ["Oh that's not-", "A few you fatties", "In the sense that-", "What the sigma?"], correctAnswer: "A few you fatties"),
        Question(questions: "9. Who is Flashback Mary?", options: ["Wendy Williams", "Trisha Paytas", "James Charles", "Tana Mongeau"], correctAnswer: "James Charles"),
        Question(questions: "10. Who said “Then you should probably eat.”" , options: ["Olivia Rodrigo", "Selena Gomez", "Shailene Woodley", "Debby Ryan"], correctAnswer: "Shailene Woodley")
    ]
    
    var body: some View {
        //this nav view will lead them to the final page later
        NavigationView {
            ZStack {
                //this is the background image used
                Image("brainrotQuiz")
                //this makes the image zoom out to fit the screen normally
                    .resizable()
                //this fills the image to screen
                    .scaledToFill()
                //this extends the background image from edge to edge w/o safety border
                    .ignoresSafeArea()
                VStack {
                    //using text interpolation, this will update while displaying the user their current score
                    Text("Score: \(currentScore)")
                        .frame(width: 120, height: 45)
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .background(Color.white)
                        .padding()
                    //this makes sure the questions still display and run before the quiz is completed (when user clicks answer on final option
                    if currentQuestionIndex < questionsArray.count && !quizCompleted {
                        VStack {
                            //this displays the question every round
                            Text(questionsArray[currentQuestionIndex].questions)
                                .foregroundColor(.black)
                                .frame(width: 270, height: 120)
                                .padding(.horizontal, 10)
                                .background(Color.white)
                                .font(.system(size: 25))
                                .padding(.bottom,30)
                            //this makes a button for each option per question
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
                        }
                        //when the quiz is completed, the user will see the button "next" so check their score on the third file
                    } else if quizCompleted {
                        NavigationLink(destination: FinalPageView(finalScore: currentScore)) {
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .frame(width: 220, height: 65)
                                .background(Color.red)
                                .cornerRadius(15.0)
                                .padding(25)
                        }
                    }
                }
            }
        }
    }
    
    //this func is suppsoed to check the user's input (selectedOption) if it's correct or not
    func checkAnswer(selectedOption: String) {
        //if their selected option matches with the correct answer in the questionArray,
        if selectedOption == questionsArray[currentQuestionIndex].correctAnswer {
            //the bool turns true bc user got it right
            correct = true
            //their score gets added by one
            currentScore += 1
        }
        //the index adds one so user can go onto next question
        currentQuestionIndex += 1
        //when the user's index matches the total num of questions in array, they reached the end of quiz
        if currentQuestionIndex == questionsArray.count {
            //bool turns true bc user finished quiz
            quizCompleted = true
        }
    }
}

struct QuestionsPageView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsPageView()
    }
}
