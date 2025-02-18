//
//  CourcesBigElement.swift
//  GetReadyForInterview
//
//  Created by Руслан on 18.02.2025.
//

import SwiftUI

struct CourcesElement: View {
    @State var bigElement: Bool
    @State var cource: QuestionsTypes = .Swift
    @State var cornerRadius: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(.ultraThinMaterial)
            
            VStack {
                HStack {
                    Image("\(cource.rawValue)")
                        .resizable()
                        .scaledToFit()
                        .padding(.top,20)
                        .padding(.horizontal, 20)
                    if bigElement {
                        Spacer()
                    }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(cource.rawValue)")
                        .font(.system(size: bigElement ? 40 : 20, weight: .bold))
                    Text(" \(QuestionService.shared.getValue(cource)) вопросов")
                        .font(.system(size: 15, weight: .bold))
                    if bigElement {
                        Text("В данной категории все вопросы по \(cource.rawValue)")
                            .font(.system(size: 15, weight: .regular))
                            .lineLimit(2)
                    }
                    
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
            }
        }
    }
    init(bigElement: Bool, cource: QuestionsTypes, cornerRadius: CGFloat) {
        self.bigElement = bigElement
        self.cource = cource
        self.cornerRadius = cornerRadius
    }
}

#Preview {
    CourcesElement(bigElement: true, cource: .Swift, cornerRadius: 20)
}
