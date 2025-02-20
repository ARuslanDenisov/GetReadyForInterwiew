//
//  StudyView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct StudyViewAllTheme: View {
    @StateObject var viewModel: StudyViewModel = StudyViewModel()
    @State var scrollOffset: CGFloat = 0
    var body: some View {
        ZStack {
            //header
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .ignoresSafeArea()
                        .blur(radius: 6)
                        .opacity(0.2 + Double(scrollOffset/100) )
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
                    .opacity(0.3 + Double(scrollOffset/100) )
                }
                .frame(height: 35)
                Spacer()
            }
            ScrollView (.vertical, showsIndicators: false) {
                GeometryReader { geometry in
                    Text("")
                        .preference(key: OffsetKey.self , value: geometry.frame(in: .global).minY)
                }
                .frame(height: 0)
                .onPreferenceChange(OffsetKey.self) { value in
                    self.scrollOffset = value
                }
                Spacer()
                    .frame(height: 60)
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.ultraThinMaterial)
                    VStack {
                        ForEach(QuestionsTypes.allCases, id: \.self) { questionType in
                            NavigationLink {
                                
                            } label: {
                                VStack {
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .frame(width: 60, height: 60)
                                                .foregroundStyle(.lightGray)
                                                .shadow(color: .black.opacity(0.4), radius: 15, y: 15)
                                            Image("\(questionType.rawValue)")
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(Circle())
                                                .frame(width: 35, height: 35)
                                        }
                                        .padding(.horizontal, 10)
                                        VStack(alignment: .leading) {
                                            Text("Все вопросы на тему: ")
                                                .font(.system(size: 10))
                                                .foregroundStyle(.black)
                                            Text("\(questionType.rawValue)")
                                                .font(.system(size: 26, weight: .bold))
                                                .foregroundStyle(.black)
                                                .padding(.vertical, 2)
                                            Text("Прогресс:")
                                                .font(.system(size: 10))
                                                .foregroundStyle(.black)
                                            HStack {
                                                ProgressBar(progress: QuestionService.shared.getProgress(theme: questionType), width: 160)
                                                Spacer()
                                            }
                                            
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(10)
                                    Divider()
                                        .frame(width: 300)
                                        .shadow(color: .black.opacity(1), radius: 10)
                                }
                                
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal, 45)
            .shadow(radius: 10)
        }
    }
    
}

#Preview {
    RootView()
}
