//
//  SplashScreen.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 12.04.2024.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    @Environment(SplashScreenViewModel.self)
    private var viewModel
    
    // The size 600 x 400 works for all phone screen sizes (but we can adjust it based on requirements)
    private var lottieViewWidth: CGFloat = 600
    private var lottieViewHeight: CGFloat = 400
    
    // Animation duration
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        Rectangle()
            .fill(.black)
            .overlay {
                if let logoUrl = viewModel.logoUrl {
                    LottieView {
                        await LottieAnimation.loadedFrom(url: logoUrl)
                    }
                    .playing(.fromProgress(0, toProgress: progress, loopMode: .playOnce))
                    .animationDidFinish { completed in
                        viewModel.isSplashFinished = progress != 0 && completed
                    }
                    .frame(width: lottieViewWidth, height: lottieViewHeight)
                    .task {
                        // Delay from start animation to finish animation
                        try? await Task.sleep(for: .seconds(0.5))
                        progress = 0.8
                    }
                }
            }
            .ignoresSafeArea()
    }
}

#Preview {
    NetflixAnimationMainView()
        .preferredColorScheme(.dark)
}
