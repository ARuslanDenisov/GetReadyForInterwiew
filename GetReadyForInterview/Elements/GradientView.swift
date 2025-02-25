//
//  GradientView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 25.02.2025.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .lightGrayApp]), startPoint: .top, endPoint: .bottom)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GradientView()
}
