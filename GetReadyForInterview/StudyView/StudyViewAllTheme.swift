//
//  StudyView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct StudyViewAllTheme: View {
    @State var scrollOffset: CGFloat = 0
    var body: some View {
        ZStack {
            //header
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 35)
                        .foregroundStyle(.lightGrayApp)
                        .shadow(radius: 3)
                        
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.redApp)
                            Text("2")
                                .font(.system(size: 32, weight: .light, design: .default))
                                .foregroundStyle(.white)
                        }
                        Text("Учить")
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
            //main
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
                    .frame(height: 90)
                ZStack {
                    RoundedRectangle(cornerRadius: 35)
                        .foregroundStyle(.lightGrayApp)
                    VStack {
                        ForEach(QuestionsTypes.allCases, id: \.self) { questionType in
                            NavigationLink {
                                QuestionsView(questionType: questionType, header: questionType.rawValue)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                VStack {
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .frame(width: 60, height: 60)
                                                .foregroundStyle(.lightGrayApp)
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
            .padding(.horizontal, 25)
            .shadow(radius: 10)
        }
    }
    
}

#Preview {
    RootView(tab: 1)
}
