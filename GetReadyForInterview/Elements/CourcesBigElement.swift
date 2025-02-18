//
//  CourcesBigElement.swift
//  GetReadyForInterview
//
//  Created by Руслан on 18.02.2025.
//

import SwiftUI

struct CourcesBigElement: View {
    @State var cource: QuestionsTypes = .Swift
    @State var cornerRadius: CGFloat = 10
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(.ultraThinMaterial)
            
            VStack {
                Image("\(cource.rawValue)")
                    .resizable()
                    .scaledToFit()
                    .padding(.top,20)
                    .padding(.horizontal, 10)
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(cource.rawValue)")
                        .font(.system(size: 40, weight: .bold))
                    Text("количество вопросов - \(QuestionService.shared.getValue(cource))")
                        .font(.system(size: 15, weight: .bold))
                    Text("В данной категории все вопросы по \(cource.rawValue)")
                        .font(.system(size: 15, weight: .regular))
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
            }
        }
    }
}

#Preview {
    CourcesBigElement(cource: .Swift)
}
