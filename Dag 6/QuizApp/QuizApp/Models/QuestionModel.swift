//
//  QuestionModel.swift
//  QuizApp
//
//  Created by Michael Gustavsson on 2021-02-09.
//

import Foundation
import UIKit

struct Question: QuestionProtocol {
    var correctAnswer: Bool
    var question: String
    var image: UIImage
}
