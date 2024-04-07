//
//  AnimatedStickyHeaderMainView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct AnimatedStickyHeaderMainView: View {
    var body: some View {
        GeometryReader { proxy in
            AnimatedStickyHeaderView(topEdge: proxy.safeAreaInsets.top)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    AnimatedStickyHeaderMainView()
}
