//
//  OffsetModifier.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

// Getting scrollView offset
struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                GeometryReader { proxy -> Color in
                    
                    // Getting Value for coordinate space called scroll
                    let minY = proxy.frame(in: .named("CSROLL")).minY
                    print(minY)
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return Color.clear
                }
            }
    }
}
