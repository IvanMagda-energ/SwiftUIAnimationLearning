//
//  Color+Extensions.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: 0.7
        )
    }
}
