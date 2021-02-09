//
//  QuizProtocol.swift
//  QuizApp
//
//  Created by Michael Gustavsson on 2021-02-09.
//

import Foundation

protocol QuizProtocol {
    var questions: [Question] { set get }
    
    func getScore() -> String
    func getQuestion() -> Question
    func check(answer: Bool) -> Bool
    func nextQuestion() -> Bool
    func reset()
}
