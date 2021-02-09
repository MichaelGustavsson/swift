//
//  QuestionProtocol.swift
//  QuizApp
//
//  Created by Michael Gustavsson on 2021-02-09.
//

import Foundation
import UIKit

protocol QuestionProtocol {
    var correctAnswer: Bool { get set }
    var question: String { get set }
    var image: UIImage { get set }
}
