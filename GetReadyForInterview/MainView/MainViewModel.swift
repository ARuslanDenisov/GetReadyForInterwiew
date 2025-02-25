//
//  MainViewModel.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import Foundation


class MainViewModel: ObservableObject {
    @Published var mainCources: [QuestionsTypes] = [.Swift, .SwiftUI, .UIKit]
}
