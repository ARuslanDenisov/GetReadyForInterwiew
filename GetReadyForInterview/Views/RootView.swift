//
//  ContentView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI
import SwiftData

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
   
    var body: some View {
        NavigationView {
           
            ZStack {
                
                GradientView()
//                Image("bg")
//                    .resizable()
//                    .ignoresSafeArea()
//                    .scaledToFill()
//                    .blur(radius: 5)

                switch viewModel.tabBarIndex {
                case 0:
                    MainView()
                        .transition(.opacity)
                    
                case 1:
                    StudyViewAllTheme()
                        .transition(.opacity)
                    
                case 2:
                    TrainView()
                        .transition(.opacity)
                    
                case 3:
                    InterviewView()
                        .transition(.opacity)
                default:
                    MainView()
                        .transition(.opacity)
                    
                }
                
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .foregroundStyle(.lightGrayApp)
                            .opacity(1)
                            .frame(width: 340, height: 65)
                            .shadow(color: .black.opacity(0.3), radius: 15)
                        TabBarView(selectedTab: $viewModel.tabBarIndex)
   
                    }
                    
                }
                
            }
            
            
        }
        .navigationViewStyle(.stack)
    }
    init() {
        
    }
    init(tab: Int) {
        viewModel.tabBarIndex = tab
    }
}

#Preview {
    RootView()
}
