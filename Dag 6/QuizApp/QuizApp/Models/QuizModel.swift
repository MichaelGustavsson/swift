//
//  QuizModel.swift
//  QuizApp
//
//  Created by Michael Gustavsson on 2021-02-09.
//

import Foundation
import UIKit

class QuizModel: QuizProtocol {
    private var score = 0
    private var index = 0
    
    var questions: [Question] = [
        Question(correctAnswer: true, question: "Ser du en bil", image: UIImage(named: "car")!),
        Question(correctAnswer: false, question: "Ser du en katt", image: UIImage(named: "dog")!),
        Question(correctAnswer: false, question: "Ser du ett flygplan", image: UIImage(named: "motorboat")!),
        Question(correctAnswer: true, question: "Ser du apelsiner", image: UIImage(named: "oranges")!)
    ]
    
    func getScore() -> String {
        return "\(score) \\ \(questions.count)"
    }
    
    func getQuestion() -> Question {
        return questions[index]
    }
    
    func check(answer: Bool) -> Bool {
        let question = getQuestion()
        
        if question.correctAnswer == answer {
            score += 1
            return true
        }
        return false
    }
    
    func nextQuestion() -> Bool {
        index += 1
        
        if index >= questions.count {
            return false
        }
        
        return true
    }
    
    func reset() {
        index = 0
        score = 0
    }
    
    
}
