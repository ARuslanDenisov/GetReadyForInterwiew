//
//  StudyViewModel.swift
//  GetReadyForInterview
//
//  Created by Руслан on 20.02.2025.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    @Published var questions: [QuestionModel] = []
}
