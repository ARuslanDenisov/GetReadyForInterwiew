//
//  ProgressBar.swift
//  GetReadyForInterview
//
//  Created by Руслан on 20.02.2025.
//

import SwiftUI

struct ProgressBar: View {
    @State var progress: Double
    @State var width: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 10)
                .frame(width: width)
                .foregroundStyle(.lightGrayApp.opacity(0.4))
                .shadow(radius: 5)
            
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 10)
                    .frame(width: width * progress)
                    .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    ProgressBar(progress: 0.5, width: 300)
}
