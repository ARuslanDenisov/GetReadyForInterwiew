//
//  CourcesBigElement.swift
//  GetReadyForInterview
//
//  Created by Руслан on 18.02.2025.
//

import SwiftUI

struct CourceBigElement: View {
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
                        .blendMode(.darken)

                    
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundStyle(.redApp)
                            .shadow(radius: 4)
                        
                        
                        VStack() {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.redApp)
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.white)
                                    .frame(width: 30, height: 30)
                                    .offset(y: 2)
                                
                            }
                            .padding(10)
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(height: 1)
                                .padding(.horizontal, 5)
                            VStack(alignment: .center) {
                                Text("10")
                                    .font(.system(size: 50, weight: .light))
                                Text("вопросов")
                                    .font(.system(size: 8, weight: .light))
                            }
                            .foregroundStyle(.white)
                            .padding(10)
                            
                        }
                    }.frame(width: 90)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(cource.rawValue)")
                        .font(.system(size: 40, weight: .light))
                    
                    Text("В данной категории все вопросы по \(cource.rawValue)")
                        .font(.system(size: 15, weight: .ultraLight))
                        .lineLimit(2)
                        .padding(.vertical, 5)
          
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
    RootView()
    //    CourcesElement(bigElement: true, cource: .Swift, cornerRadius: 20)
}
