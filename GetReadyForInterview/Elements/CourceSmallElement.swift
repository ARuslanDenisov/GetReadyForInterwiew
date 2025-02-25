//
//  CourceSmallElement.swift
//  GetReadyForInterview
//
//  Created by Руслан on 25.02.2025.
//

import SwiftUI

struct CourceSmallElement: View {
    @State var cource: QuestionsTypes = .Swift
    @State var cornerRadius: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(.lightGrayApp)
            
            VStack(spacing: 0) {
                HStack {
                    Image("\(cource.rawValue)")
                        .resizable()
                        .scaleEffect(1.3)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .scaledToFit()
                        .shadow(radius: 2)
//                        .saturation(0)
                       

                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(cource.rawValue)")
                        .font(.system(size: 30, weight: .light))
                    
                    Text("10 вопросов")
                        .font(.system(size: 20, weight: .ultraLight))
          
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
            }
        }
    }
    init(cource: QuestionsTypes, cornerRadius: CGFloat) {
        self.cource = cource
        self.cornerRadius = cornerRadius
    }
}

#Preview {
    CourceSmallElement(cource: .Swift, cornerRadius: 50)
}
