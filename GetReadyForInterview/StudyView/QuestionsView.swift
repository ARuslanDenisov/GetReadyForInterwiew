//
//  StudyView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 20.02.2025.
//

import SwiftUI

struct QuestionsView: View {
    @StateObject var viewModel: QuestionsViewModel = QuestionsViewModel()
    @State var scrollOffset: CGFloat = 0
    @State var questionsTheme: QuestionsTypes
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .blur(radius: 5)
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .ignoresSafeArea()
                        .blur(radius: 6)
                        .opacity(0.2 + Double(scrollOffset/100) )
                    VStack {
                        HStack {
                            Spacer()
                                .frame(width: 20)
                            Text(questionsTheme.rawValue)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .animation(.easeInOut)
                            Spacer()
                            HStack {
                                // MARK: Search
                                NavigationLink{
                                    
                                }
                                label:{
                                    SmallButonView("magnifyingglass", rad: 15)
                                        .frame(width: 50, height: 40)
                                        .shadow(radius: 5)
                                }
                                // MARK: User
                                NavigationLink{
                                    UserView()
                                }
                                label:{
                                    SmallButonView("person", rad: 15)
                                        .frame(width: 50, height: 40)
                                        .shadow(radius: 5)
                                    
                                }
                            }
                        }
                        .frame(width: 350, height: 35)
                        .opacity(0.3 + Double(scrollOffset/100) )
                        HStack(alignment: .center) {
                            
                            Text("Прогресс")
                                .font(.system(size: 15, weight: .light, design: .rounded))
                                .padding(.horizontal, 15)
                                .padding(.leading, 8)
                            ProgressBar(progress: 0.5, width: 230)
                        }
                        .frame(width: 350, height: 35)
                        .opacity(0.2 + Double(scrollOffset/100) )
                    }
                    
                }
                .frame(height: 35)
                Spacer()
        }
            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(height: 60)
                GeometryReader { geometry in
                    Text("")
                        .preference(key: OffsetKey.self , value: geometry.frame(in: .global).minY)
                }
                .frame(height: 0)
                .onPreferenceChange(OffsetKey.self) { value in
                    self.scrollOffset = value
                }
                ForEach(viewModel.questions, id: \.id) { question in
                    QuestionElement(question: question)
                        .padding(.horizontal, 4)
                        .shadow(color: .black.opacity(0.3), radius: 4, y: 4)
                        .overlay {
                            HStack {
                                Spacer()
                                VStack {
                                    Button {
                                                                            } label: {
                                        ZStack {
                                            Circle()
                                                .foregroundStyle(.white)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "cross.fill")
                                        }
                                        .shadow(radius: 4)
                                    }
                                    .offset(x: -3, y: -16)
                                    Spacer()
                                }
                            }
                        }
                        
                }
            }
            .frame(width: 350)
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .padding(10)
                    }
                    Spacer()
                }
                .frame(width: 400)
                Spacer()
            }
            
            .onAppear {
                viewModel.questions = QuestionService.shared.getQuestions(theme: questionsTheme)
            }
        }
    }
    init(questionType: QuestionsTypes, header: String) {
        self.questionsTheme = questionType
    }
}

#Preview {
//    RootView()
    QuestionsView(questionType: .Swift, header: "Swift")
}
