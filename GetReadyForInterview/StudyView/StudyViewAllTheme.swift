//
//  StudyView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct StudyViewAllTheme: View {
    @StateObject var viewModel: StudyViewModel = StudyViewModel()
    var body: some View {
        VStack {
            //header
            HStack {
                Text("Учить")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .animation(.easeInOut)
                Spacer()
                HStack {
                    // MARK: Search
                    NavigationLink{
                        
                    }
                    label:{
                        SmallButonView("magnifyingglass", rad: 15)
                            .frame(minWidth: 44, maxWidth: 44)
                            .shadow(radius: 5)
                    }
                    // MARK: User
                    NavigationLink{
                        UserView()
                    }
                    label:{
                        SmallButonView("person", rad: 15)
                            .frame(minWidth: 44, maxWidth: 44)
                            .shadow(radius: 5)
                        
                    }
                }
            }
            .frame(width: 350, height: 35)
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.ultraThinMaterial)
                    VStack {
                        ForEach(QuestionsTypes.allCases, id: \.self) { questionType in
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 60, height: 60)
                                            .foregroundStyle(.lightGray)
                                            .shadow(color: .black.opacity(0.4), radius: 15, y: 10)
                                        Image("\(questionType.rawValue)")
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(Circle())
                                            .frame(width: 35, height: 35)
                                    }
                                    .padding(.horizontal, 10)
                                    VStack {
                                        Text("Все вопросы на тему: ")
                                        Text("\(questionType.rawValue)")
                                        Text("Прогресс:")
                                        ProgressBar(value: 0.5)
                                        
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
}

#Preview {
    StudyViewAllTheme()
}
