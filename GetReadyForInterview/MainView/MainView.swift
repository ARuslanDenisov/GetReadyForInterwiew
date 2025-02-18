//
//  MainView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct MainView: View {
    @State var selectedCource: Int = 0
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("Основные")
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
            Spacer()
        }
        ScrollView(.vertical, showsIndicators: false) {
            Spacer()
                .frame(height: 30)
            VStack {
//                HStack {
//                    Text("Основные секции")
//                        .font(.system(size: 25, weight: .bold, design: .default))
//                        .padding(.horizontal, 25)
//                    Spacer()
//                }
//                .frame(height: 25)
                TabView(selection: $selectedCource) {
                    ForEach(0..<10) { index in
                        
                        CourcesElement(bigElement: true, cource: .Swift, cornerRadius: 40)
//                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .frame(width: 350, height: 340)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            }
            .frame(height: 400)
            VStack {
                HStack {
                    Text("Недавние темы")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.horizontal, 50)
                    Spacer()
                }
                .frame(height: 25)
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        Spacer()
                            .frame(width: 40)
                        ForEach(0..<10) { index in
                            CourcesElement(bigElement: false, cource: .Swift, cornerRadius: 20)
                                .frame(width: 160, height: 250)
                                .padding(.leading, 5)
                                .padding(5)
                                .shadow(color: .black.opacity(0.25), radius: 7)
                                
                        }
                        Spacer()
                            .frame(width: 40)
                    }
                    .frame(height: 270)
                    
                }
            }
            .padding(.top, 20)
            .frame(height: 250)
            VStack {
                HStack {
                    Text("Основные темы")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.bottom, 10)
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.ultraThinMaterial)
                    VStack {
                        ForEach(0..<3) { index in
                            NavigationLink {
                                StudyView()
                            } label: {
                                VStack {
                                    HStack() {
                                        Image(viewModel.mainCources[index].rawValue)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .padding(.leading, 15)
                                        Text("\(viewModel.mainCources[index].rawValue)")
                                            .foregroundStyle(.black)
                                        Spacer()
                                    }
                                    .padding(5)
                                    if index != 2 {
                                        Divider()
                                            .frame(width: 300)
                                    }
                                }
                            }
                        }
                    }
                }
                .shadow(color: .black.opacity(0.25), radius: 7)
               
            }
            .frame(height: 200)
            .padding(50)
            Spacer()
                .frame(height: 50)
        }
    }
    private func scaleValue(geometry: GeometryProxy) -> CGFloat {
        let midX = geometry.frame(in: .global).midX
        let screenMidX = UIScreen.main.bounds.width / 2
        let distance = abs(midX - screenMidX)
        let scale = max(1 - distance / 1000, 0.8)
        return scale
    }
}

#Preview {
    RootView()
}


//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 20) {
//                ForEach(0..<10) { index in
//                    GeometryReader { geometry in
//                        CellView(index: index)
//                            .scaledToFill()
//                            .frame(width: 300, height: 400)
//                            .cornerRadius(20)
//                            .shadow(radius: 10)
//                            .scaleEffect(scaleValue(geometry: geometry))
//                            .animation(.easeOut(duration: 0.5), value: geometry.frame(in: .global).minX)
//                    }
//                    .frame(width: 300, height: 400)
//                }
//            }
//            .padding(.horizontal, 20)
//        }
//        .contentMargins(32)
//        .scrollTargetBehavior(.paging)
//        .scrollIndicators(.hidden)
