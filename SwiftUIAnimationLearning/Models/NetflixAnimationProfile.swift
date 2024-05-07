//
//  NetflixAnimationProfile.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 04.05.2024.
//

import SwiftUI

/// This is a simple profile model, the source ID will be utilized in anchor preferences to determine the image view's boundaries.
struct NetflixAnimationProfile: Identifiable {
    var id: UUID = UUID()
    var name: String
    var icon: String
    
    var sourceAnchorId: String {
        id.uuidString + "SOURCE"
    }
    
    var destinationAnchorId: String {
        id.uuidString + "DESTINATION"
    }
}
