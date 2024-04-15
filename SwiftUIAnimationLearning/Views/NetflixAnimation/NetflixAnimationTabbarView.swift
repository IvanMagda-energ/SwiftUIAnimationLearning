//
//  NetflixAnimationTabbarView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 14.04.2024.
//

import SwiftUI

struct NetflixAnimationTabbarView: View {
    @Environment(SplashScreenViewModel.self) var viewModel
    var body: some View {
        HStack(spacing: 0) {
            ForEach(NetflixAnimationTab.allCases, id: \.rawValue) { tab in
                Button {
                    viewModel.activeTab = tab
                } label: {
                    VStack(spacing: 2) {
                        Group {
                            if tab.icon == "Profile" {
                                Image("Anny")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 25, height: 25)
                                    .clipShape(.rect(cornerRadius: 5))
                                    .frame(width: 35, height: 35)
                            } else {
                                Image(systemName: tab.icon)
                                    .font(.title3)
                                    .frame(width: 35, height: 35)
                            }
                        }
                        .keyframeAnimator(initialValue: 1, trigger: viewModel.activeTab) { content, scale in
                            content
                                .scaleEffect(viewModel.activeTab == tab ? scale : 1)
                        } keyframes: { _ in
                            CubicKeyframe(1.2, duration: 0.2)
                            CubicKeyframe(1, duration: 0.2)
                        }
                        
                        Text(tab.rawValue)
                            .font(.caption2)
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .animation(.snappy) { content in
                        content
                            .opacity(viewModel.activeTab == tab ? 1 : 0.6)
                    }
                    .contentShape(.rect)
                    .buttonStyle(NoAnimationButtonStyle())
                }

            }
        }
        .padding(.bottom, 10)
        .padding(.top, 5)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    NetflixAnimationHomeView()
        .preferredColorScheme(.dark)
        .environment(SplashScreenViewModel())
}
