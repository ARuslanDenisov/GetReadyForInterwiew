//
//  QuestionService.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import Foundation


class QuestionService {
    static let shared = QuestionService() ; private init() {}
    var swiftQuestions: [QuestionModel] = []
    
    func getValue(_ type: QuestionsTypes) -> Int {
        return 10
    }
    
}


extension QuestionService {
//    swiftQuestions = [
//        QuestionModel(question: <#T##String#>, answer: <#T##String?#>, type: <#T##[QuestionsTypes]#>),
//    ]
}
