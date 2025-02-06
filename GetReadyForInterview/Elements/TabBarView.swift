//
//  TabBarView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Int
    @State var selectedIndex = 0
    private let tabArray = ["Основной", "Учить", "Тренировка", "Интервью"]
    private let images = ["house","graduationcap","book","megaphone"]
    var body: some View {
        HStack {
            ForEach( tabArray.indices) { index in
                VStack {
                    Image(systemName: images[index])
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(selectedIndex == index ? .black : .gray)
                    
                    Text(tabArray[index])
                        .foregroundStyle(selectedIndex == index ? .black : .gray)
                        .font(.system(size: 11, weight: .medium))
                    
                }
                .frame(width: 70)
                .padding(.horizontal, 5)
                .onTapGesture {
                    self.selectedIndex = index
                    selectedTab = index
                }
                .animation(.easeInOut, value: index)
            }
        }
        .background(.clear)
        .frame(height: 25)
        
    }
        
    }


#Preview {
    TabBarView(selectedTab: .constant(1))
}
