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
            GradientView()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 35)
                        .foregroundStyle(.lightGrayApp)
                        .shadow(radius: 3)
                        
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.redApp)
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.white)
                                    .padding(10)
                            }
                        }
                        Text("\(questionsTheme.rawValue)")
                            .font(.system(size: 32, weight: .light, design: .default))
                            .animation(.easeInOut)
                        Spacer()
                        HStack {
                            // MARK: Search
                            NavigationLink{
                                
                            }
                            label:{
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.black)
                                    .fontWeight(.light)
    //                            SmallButonView("magnifyingglass", rad: 17)
    //                                .frame(width: 50, height: 40)
    //                                .shadow(radius: 5)
                            }
                            
                            // MARK: User
                            NavigationLink{
                                UserView()
                            }
                            label:{
                                Image(systemName: "person")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.black)
                                    .fontWeight(.light)
    //                            SmallButonView("person", rad: 17)
    //                                .frame(width: 50, height: 40)
    //                                .shadow(radius: 5)
                                
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding(.horizontal, 14)
                    .frame(width: 350, height: 35)
                    .opacity(0.3 + Double(scrollOffset/100) )
                }
                .opacity(0.8 + Double(scrollOffset/110) )
                .frame(width: 350,height: 65)
                
                
                Spacer()
            }
            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(height: 90)
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
                        .shadow(color: .black.opacity(0.3), radius: 4, y: 4)
                        .overlay {
                            HStack {
                                Spacer()
                                VStack {
                                    Button {
                                                                            } label: {
                                        ZStack {
                                            Circle()
                                                .foregroundStyle(.redApp)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "heart.fill")
                                                .foregroundStyle(.white)
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
            .padding(.horizontal,25)
            
            .onAppear {
                viewModel.questions = QuestionService.shared.getQuestions(theme: questionsTheme)
            }
            VStack {
                HStack {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .padding(10)
                    }
                    Spacer()
                }
                Spacer()
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
