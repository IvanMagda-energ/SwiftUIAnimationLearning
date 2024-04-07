//
//  ContentView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView {
                NavigationLink(destination: AnimatedStickyHeaderView(topEdge: 0)) {
                    RowView(title: "Animated sticky header")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
