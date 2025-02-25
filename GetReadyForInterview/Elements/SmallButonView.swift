//
//  SmallButonView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct SmallButonView: View {
    @State var image: String
    @State var radius: CGFloat
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius)
                .foregroundStyle(.white)
                .opacity(0.7)
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .padding(7)
                .foregroundStyle(.black)
        }
    }
    init(_ image: String, rad: CGFloat) {
        self.image = image
        self.radius = rad
    }
}

#Preview {
    SmallButonView("person", rad: 30)
}
