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
            
            if viewModel.hideMainView {
                Rectangle()
                    .fill(.black)
                    .ignoresSafeArea()
            }
            
            ZStack {
                if viewModel.showProfileView {
                    NetflixAnimationProfileView()
                }
            }
            .animation(.snappy, value: viewModel.showProfileView)
            
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
