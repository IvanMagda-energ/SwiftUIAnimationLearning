//
//  NetflixAnimationProfileView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 04.05.2024.
//

import SwiftUI

struct NetflixAnimationProfileView: View {
    @Environment(SplashScreenViewModel.self) var viewModel
    @State private var animateToCenter = false
    @State private var animateToMainView = false
    @State private var progress: CGFloat = 0
    
    private let iconSize: CGFloat = 100
    private let cornerRadius: CGFloat = 4
    private let strokeOpacity: CGFloat = 0.8
    private let strokeLineWidth: CGFloat = 0.8
    private let gridSpacing: CGFloat = 25
    private let gridColumnCount = 2
    private let padding: CGFloat = 15
    
    var body: some View {
        VStack {
            Button("Edit") {}
                .foregroundStyle(Color.red)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .overlay {
                    Text("Who's watching")
                        .font(.title3)
                }
            
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(iconSize), spacing: gridSpacing), count: gridColumnCount)) {
                ForEach(NetflixAnimationMockProfiles.profiles) { profile in
                    profileCardView(profile)
                }
                
                // Add button
                VStack {
                    Button {
                        
                    } label: {
                        ZStack() {
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(.white.opacity(strokeOpacity), lineWidth: strokeLineWidth)
                            
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .foregroundStyle(Color.white)
                        }
                        .frame(width: iconSize, height: iconSize)
                        .contentShape(.rect)
                    }
                    Spacer()
                }
            }
            .frame(maxHeight: .infinity)
        }
        .padding(padding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(animateToCenter ? 0 : 1)
        .background(.black)
        .opacity(animateToMainView ? 0 : 1)
        .overlayPreferenceValue(RectAnchorKey.self) { value in
            animationLayerView(value)
        }
    }
    
    // Profile animation view
    func animationLayerView(_ value: [String: Anchor<CGRect>]) -> some View {
        GeometryReader { proxy in
            if let profile = viewModel.watchingProfile, let sourceAnchor = value[profile.sourceAnchorId], viewModel.animateProfile {
                let sRect = proxy[sourceAnchor]
                let screenRect = proxy.frame(in: .global)
                // Position
                let sourcePosition = CGPoint(x: sRect.minX, y: sRect.minY)
                let centerPosition = CGPoint(x: screenRect.width / 2 , y: (screenRect.height / 2) - 40)
                let destinationPosition = CGPoint(x: viewModel.tabProfileRect.midX, y: viewModel.tabProfileRect.midY)
                let animationPath = Path { path in
                    path.move(to: centerPosition)
                    path.addQuadCurve(to: destinationPosition, control: CGPoint(x: centerPosition.x * 2, y: centerPosition.y - (centerPosition.y / 0.8)))
                }
                
                let endPosition = animationPath.trimmedPath(from: 0, to: 1).currentPoint ?? destinationPosition
                let currentPosition = animationPath.trimmedPath(from: 0, to: 0.97).currentPoint ?? destinationPosition
                let diff = CGSize(width: endPosition.x - currentPosition.x, height: endPosition.y - currentPosition.y)
                
                // Selected profile image view width loading indicator
                ZStack {
                    Image(profile.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: animateToMainView ? 25 : sRect.width, height: animateToMainView ? 25 : sRect.height)
                        .animation(.snappy(duration: 0.3, extraBounce: 0), value: animateToMainView)
                        .clipShape(.rect(cornerRadius: cornerRadius))
                        .opacity(animateToMainView && viewModel.activeTab != .account ? 0.6 :1)
                        .modifier (
                            AnimatedPositionModifier(
                                source: sourcePosition,
                                center: centerPosition,
                                destination: destinationPosition,
                                animateToCenter: animateToCenter,
                                animateToMainView: animateToMainView,
                                path: animationPath,
                                progress: progress
                            )
                        )
                        .offset(animateToMainView ? diff : .zero)
                    
                    // Custom Netflix loading indicator
                    NetflixLoadingIndicator()
                        .frame(width: 60, height: 60)
                        .offset(y: 80)
                        .opacity(animateToCenter ? 1 : 0)
                        .opacity(animateToMainView ? 0 : 1)
                }
                .transition(.identity)
                .task {
                    guard !animateToCenter else { return }
                    await animateUser()
                }
            }
        }
    }
    
    func animateUser() async {
        withAnimation(.bouncy(duration: 0.35)) {
            animateToCenter = true
        }
        await loadContents()
        
        withAnimation(.snappy(duration: 0.6, extraBounce: 0.1), completionCriteria: .removed) {
            animateToMainView = true
            viewModel.hideMainView = false
            progress = 0.97
        } completion: {
            viewModel.showProfileView = false
            viewModel.animateProfile = false
        }
    }
    
    // Load Contents
    func loadContents() async {
        // Load any network content here
        try? await Task.sleep(for: .seconds(1))
    }
    
    // ProfileCardView
    func profileCardView(_ profile: NetflixAnimationProfile) -> some View {
        VStack(spacing: 8) {
            let status = profile.id == viewModel.watchingProfile?.id
            GeometryReader { proxy in
                Image(profile.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iconSize, height: iconSize)
                    .clipShape(.rect(cornerRadius: cornerRadius))
                    .opacity(animateToCenter ? 0 : 1)
            }
            .animation(status ? .none : .bouncy(duration: 0.35), value: animateToCenter)
            .frame(width: iconSize, height: iconSize)
            .anchorPreference(key: RectAnchorKey.self, value: .bounds, transform: { anchor in
                return [profile.sourceAnchorId: anchor]
            })
            
            Text(profile.name)
                .fontWeight(.semibold)
                .lineLimit(1)
        }
        .onTapGesture {
            viewModel.watchingProfile = profile
            viewModel.animateProfile = true
        }
    }
}

#Preview {
    NetflixAnimationMainView()
}
