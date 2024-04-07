//
//  AnimationStickyHeaderViewModel.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

final class AnimationStickyHeaderViewModel {
    func getHeaderHeight(maxHeight: CGFloat, offset: CGFloat, topEdge: CGFloat) -> CGFloat {
        // 80 is the constant top Nav bar height
        // since we included top save area so we also need to include that to
        let topHeight = maxHeight + offset
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getCornerRadius(maxHeight: CGFloat, offset: CGFloat, topEdge: CGFloat) -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
    
    func getTopBarTitleOpacity(maxHeight: CGFloat, offset: CGFloat, topEdge: CGFloat) -> CGFloat {
        // To start after the main content vansihed we need to eliminate 70 from offset
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}
