//
//  TopNavigationView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct TopNavigationView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var offset: CGFloat
    
    var topEdge: CGFloat
    var maxHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.bold())
            }
            
            Image("EricCarman")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                .opacity(getTopBarTitleOpacity())
            
            Text("Jon Dow")
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .opacity(getTopBarTitleOpacity())
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.body.bold())
            }
        }
        .padding(.horizontal)
        // Max height
        .frame(height: 60)
        .foregroundStyle(.white)
        .padding(.top, topEdge)
    }
    
    // MARK: - Private
    private func getTopBarTitleOpacity() -> CGFloat {
        // To start after the main content vanished we need to eliminate 70 from offset
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}

#Preview {
    TopNavigationView(offset: .constant(0), topEdge: 0, maxHeight: 0)
}
