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
                
                
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    HStack {
                        Text("\(viewModel.getScreenName())")
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
                            }
                            // MARK: User
                            NavigationLink{
                                
                            }
                            label:{
                                SmallButonView("person", rad: 15)
                                    .frame(minWidth: 44, maxWidth: 44)
                                    
                            }
                        }
                    }
                    .frame(width: 350, height: 35)
                    Spacer()
                }
                switch viewModel.tabBarIndex {
                case 0:
                    MainView()
                        .transition(.opacity)
                    
                case 1:
                    StudyView()
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
                            .foregroundStyle(.ultraThinMaterial)
                            .opacity(0.7)
                            .frame(width: 350, height: 65)
                        TabBarView(selectedTab: $viewModel.tabBarIndex)
                            
                    }
                    
                }
                
            }
            
            
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    RootView()
}
