//
//  QuestionModel.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import Foundation

struct QuestionModel: Codable, Identifiable {
    var id: String = UUID().uuidString
    let question: String
    let answer: String
    let type: [QuestionsTypes]
    var isChecked: Bool = false
    
    init(question: String, answer: String, type: [QuestionsTypes] = []) {
        self.question = question
        self.answer = answer
        self.type = type
    }
    init() {
        question = ""
        answer = ""
        type = [QuestionsTypes.Swift]
    }
}
