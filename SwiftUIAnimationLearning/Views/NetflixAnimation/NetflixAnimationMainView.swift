//
//  NetflixAnimationMainView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 14.04.2024.
//

import SwiftUI

struct NetflixAnimationMainView: View {
    var viewModel: SplashScreenViewModel = .init()
    var body: some View {
        ZStack {
            // First view after Splash Screen
            NetflixAnimationHomeView()
                .onAppear {
                    // Is needed in order for the view to start from animation every time                    viewModel.isSplashFinished = false
                }
            
            if !viewModel.isSplashFinished {
                SplashScreen()
            }
        }
        .environment(viewModel)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    NetflixAnimationMainView()
}
