//
//  NetflixLoadingIndicator.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 04.05.2024.
//

import SwiftUI

struct NetflixLoadingIndicator: View {
    @State private var isSpinning = false
    var body: some View {
        Circle()
            .stroke(
                .linearGradient(
                    colors: [
                        .red,
                        .red,
                        .red,
                        .red,
                        .red.opacity(0.7),
                        .red.opacity(0.4),
                        .red.opacity(0.1),
                        .clear
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                ), lineWidth: 6
            )
            .rotationEffect(.degrees(isSpinning ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: false)){
                    isSpinning = true
                }
            }
    }
}

#Preview {
    NetflixLoadingIndicator()
        .frame(width: 100, height: 100)
        .preferredColorScheme(.dark)
}
