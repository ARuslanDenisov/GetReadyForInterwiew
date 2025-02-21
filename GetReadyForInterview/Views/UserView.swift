//
//  USerView.swift
//  GetReadyForInterview
//
//  Created by Руслан on 06.02.2025.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ZStack {
            VStack {
//                RoundedRectangle(cornerRadius: 20)
//                    .frame(width: 300, height: 400)
//                    .foregroundStyle(.red)
//                    .overlay {
//                        Circle()
//                            .frame(width: 50)
//                            .background(.clear)
//                            .blendMode(.destinationOut)
//                    }
//                    .compositingGroup()
//                
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.black)
                    .frame(height: 100)
                    .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 70)
                                .offset(y: -15)
                                .background(.clear)
                                .blendMode(.destinationOut)
                        }
                        .compositingGroup()
                        
                    }
//                RoundedRectangle(cornerRadius: 10)
//                    .foregroundStyle(.lightGray)
//                    .frame(height: 70)
//                    .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
//            }
        }
    }
}

#Preview {
    UserView()
}
