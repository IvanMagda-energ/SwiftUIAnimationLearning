//
//  RectAnchorKey.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 04.05.2024.
//

import SwiftUI

struct RectAnchorKey: PreferenceKey {
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    static func reduce(value: inout [String: Anchor<CGRect>], nextValue: () -> [String: Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}
