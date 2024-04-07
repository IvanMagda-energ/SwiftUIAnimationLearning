//
//  AnimatedStickyHeaderView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct AnimatedStickyHeaderView: View {
    let viewModel = AnimationStickyHeaderViewModel()
    // Max Height
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                // TopNavView
                GeometryReader { proxy in
                    
                    TopBarView(offset: $offset, topEdge: topEdge, maxHeight: maxHeight)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    // Sticky effect
                        .frame(
                            height: viewModel.getHeaderHeight(
                                maxHeight: maxHeight,
                                offset: offset,
                                topEdge: topEdge
                            ),
                            alignment: .bottom
                        )
                        .background(
                            .indigo,
                            in: CustomCorner(
                                corners: [.bottomRight],
                                radius: viewModel.getCornerRadius(
                                    maxHeight: maxHeight,
                                    offset: offset,
                                    topEdge: topEdge
                                )
                            )
                        )
                        .overlay(alignment: .top) {
                            // Top nav view
                            HStack(spacing: 15) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                }
                                
                                Image("User")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .opacity(
                                        viewModel.getTopBarTitleOpacity(
                                            maxHeight: maxHeight,
                                            offset: offset,
                                            topEdge: topEdge
                                        )
                                    )
                                
                                Text("Jon Dow")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                    .opacity(
                                        viewModel.getTopBarTitleOpacity(
                                            maxHeight: maxHeight,
                                            offset: offset,
                                            topEdge: topEdge
                                        )
                                    )
                                
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
    }
}

#Preview {
    AnimatedStickyHeaderView(topEdge: 10)
}
