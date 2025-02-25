//
//  TrainView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct TrainView: View {
    @State private var scrollOffset: CGFloat = 0
    @State var boolButton: Bool = true
    var body: some View {
        VStack {
            Text("trainView")
            Text("Выбор тем")
            HStack {
                Button {
                    boolButton.toggle()
                } label: {
                    Circle()
                        .foregroundStyle(.redApp)
                    
                }
                .frame(width: 40, height: 40)
                Text("1")
                
            }
            Text("выбор по кол-ву вопросов")
            HStack{
                Text("10")
                Text("30")
                Text("все вопросы")
            }
            Capsule()
                .frame(width: 200, height: 20)
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
