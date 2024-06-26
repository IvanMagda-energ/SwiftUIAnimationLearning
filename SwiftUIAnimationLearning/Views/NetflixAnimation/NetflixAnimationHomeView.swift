//
//  NetflixAnimationHomeView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 14.04.2024.
//

import SwiftUI

struct NetflixAnimationHomeView: View {
    var body: some View {
        VStack {
            Spacer()
            // Custom tab bar
            NetflixAnimationTabbarView()
        }
        .coordinateSpace(.named("NETFLIXANIMATIONHOMEVIEW"))
    }
}

#Preview {
    NetflixAnimationHomeView()
        .preferredColorScheme(.dark)
        .environment(SplashScreenViewModel())
}
