//
//  NetflixAnimationTab.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 14.04.2024.
//

import SwiftUI

enum NetflixAnimationTab: String, CaseIterable {
    case home = "Home"
    case new = "New & Hot"
    case account = "My Netflix"
    
    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .new:
            return "play.rectangle.on.rectangle"
        case .account:
            return "Profile"
        }
    }
}
