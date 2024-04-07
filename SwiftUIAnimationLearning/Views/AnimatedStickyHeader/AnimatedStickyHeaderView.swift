//
//  AnimatedStickyHeaderView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct AnimatedStickyHeaderView: View {
    @Environment(\.dismiss) var dismiss
    // Max Height
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                GeometryReader { proxy in
                    TopBarView(offset: $offset)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    // Sticky effect
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                        .background(.indigo,in: CustomCorner(corners: [.bottomRight], radius: getCornerRadius()))
                        .overlay(alignment: .top) {
                            // Top nav view
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
                }
                .frame(height: maxHeight)
                // Fixing at top
                .offset(y: -offset)
                .zIndex(1)
                
                // Sample messages
                VStack(spacing: 15) {
                    ForEach(MockMessage.preparedMessages) { message in
                        MessageCardView(message: message)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        // Settings coordinate Space
        .coordinateSpace(name: "SCROLL")
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func getHeaderHeight() -> CGFloat {
        // 80 is the constant top Nav bar height
        // since we included top save area so we also need to include that to
        let topHeight = maxHeight + offset
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
    
    func getTopBarTitleOpacity() -> CGFloat {
        // To start after the main content vansihed we need to eliminate 70 from offset
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}

#Preview {
    AnimatedStickyHeaderView(topEdge: 10)
}
