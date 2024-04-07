//
//  TopBarView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct TopBarView: View {
    @Binding var offset: CGFloat
    var topEdge: CGFloat
    var maxHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("User")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            Text("Jon Dow")
                .font(.largeTitle.bold())
            Text("In this Video I'm going to show how to create a Stylish Collapsable Animated Header Using SwiftUI")
                .fontWeight(.semibold)
                .foregroundStyle(Color.white.opacity(0.8))
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
     // Calculate opacity
    private func getOpacity() -> CGFloat {
        // 70 = Some random Amount of time to visible on scroll
        
        let progress = -offset / 70
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
}

#Preview {
    TopBarView(offset: .constant(0), topEdge: 0, maxHeight: 0)
}
