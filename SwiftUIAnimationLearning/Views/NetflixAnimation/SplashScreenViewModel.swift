//
//  SplashScreenViewModel.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 14.04.2024.
//

import SwiftUI

@Observable
class SplashScreenViewModel {
    var isSplashFinished: Bool = false
    var activeTab: NetflixAnimationTab = .home
    var hideMainView: Bool = false
    // Profile selection properties
    var showProfileView: Bool = false
    var tabProfileRect: CGRect = .zero
    var watchingProfile: NetflixAnimationProfile?
    var animateProfile: Bool = false
    var logoUrl: URL? {
        if let bundlePath = Bundle.main.path(forResource: "NetflixLogoAnimation", ofType: "json") {
            return URL(filePath: bundlePath)
        }
        return nil
    }
}
