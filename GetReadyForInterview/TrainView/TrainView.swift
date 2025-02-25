//
//  TrainView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct TrainView: View {
    @State private var scrollOffset: CGFloat = 0
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 380, height: 50)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.0 + Double(scrollOffset/150) ), radius: 4)
                
                HStack {
                    Text("Тренировка")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .animation(.easeInOut)
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
                        .foregroundStyle(.black)
                        .blur(radius: 1)
                    
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
            }
            .opacity(0.0 + Double(scrollOffset/100) )
            ScrollView(.vertical, showsIndicators: false) {
                GeometryReader { geometry in
                    Text("")
                        .preference(key: OffsetKey.self , value: geometry.frame(in: .global).minY)
                }
                .frame(height: 0)
                .onPreferenceChange(OffsetKey.self) { value in
                    // Обновляем смещение при изменении положения
                    self.scrollOffset = value
                }
                VStack {
                    ForEach(0..<7) { value in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 200)
                    }
                }
                
                Spacer()
            }
            
            
        }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
#Preview {
    TrainView()
}
