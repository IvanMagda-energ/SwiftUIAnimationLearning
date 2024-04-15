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
    
    var logoUrl: URL? {
        if let bundlePath = Bundle.main.path(forResource: "NetflixLogoAnimation", ofType: "json") {
            return URL(filePath: bundlePath)
        }
        return nil
    }
}
