//
//  RectKey.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 06.05.2024.
//

import SwiftUI

struct RectKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
