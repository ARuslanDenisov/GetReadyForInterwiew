//
//  RootViewModel.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import Foundation


@MainActor

class RootViewModel: ObservableObject {
    @Published var screenNames = ["Основной", "Учить", "Тренировка", "Интервью"]
    @Published var tabBarIndex = 0
    
    func getScreenName() -> String {
        screenNames[tabBarIndex]
    }
}
