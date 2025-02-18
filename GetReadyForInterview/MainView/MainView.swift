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
        HStack {
            Text("Основные секции")
            Spacer()
        }
        TabView(selection: $selectedCource) {
            ForEach(0..<10) { index in
                
                CourcesBigElement(cource: .Swift )
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .frame(width: 300, height: 300)
            }
        }
        .tabViewStyle(.page)
        
        Text("MainView")
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
    MainView()
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
