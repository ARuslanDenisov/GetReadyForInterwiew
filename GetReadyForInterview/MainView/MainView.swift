//
//  MainView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct MainView: View {
    @State var selectedCource: Int = 0
    @State var scrollOffset: CGFloat = 0
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        // header
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 35)
                    .foregroundStyle(.lightGrayApp)
                    .shadow(radius: 3)
                    
                HStack {
                    ZStack {
                        Circle()
                            .foregroundStyle(.redApp)
                        Text("1")
                            .font(.system(size: 32, weight: .light, design: .default))
                            .foregroundStyle(.white)
                    }
                    Text("Основные")
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
        // main block
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { geometry in
                Text("")
                    .preference(key: OffsetKey.self , value: geometry.frame(in: .global).minY)
            }
            .frame(height: 0)
            .onPreferenceChange(OffsetKey.self) { value in
                self.scrollOffset = value
            }
            Spacer()
                .frame(height: 85)
            VStack {
                TabView(selection: $selectedCource) {
                    ForEach(0..<10) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 35)
                                .foregroundStyle(.lightGrayApp)
                                .shadow(radius: 3)
                            CourceBigElement(cource: .Swift, cornerRadius: 50)
                        }
                            .frame(width: 350, height: 340)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            }
            .frame(height: 350)
            VStack {
                HStack {
                    
                    Text("Недавние темы")
                        .font(.system(size: 30, weight: .light, design: .default))
                    
                    Spacer()
                }
                
                .padding(.leading, 30)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .frame(width: 30)
                        ForEach(0..<10) { index in
                            CourceSmallElement(cource: .Swift, cornerRadius: 30)
                                .frame(width: 170, height: 250)
                                .shadow(radius: 3)
                                
                        }
                        Spacer()
                            .frame(width: 30)
                    }
                    .frame(height: 256)
                    
                }
                .frame(height: 250)
            }
            
            VStack {
                HStack (spacing: 0) {
                    Text("Основные темы")
                        .font(.system(size: 30, weight: .light, design: .default))
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.ultraThinMaterial)
                        .shadow(radius: 5)
                    VStack {
                        ForEach(0..<3) { index in
                            NavigationLink {
                                StudyViewAllTheme()
                            } label: {
                                VStack {
                                    HStack() {
                                        Image(viewModel.mainCources[index].rawValue)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .padding(.leading, 15)
//                                            .saturation(0)
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
                
               
            }
            .frame(height: 200)
            .padding(30)
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
