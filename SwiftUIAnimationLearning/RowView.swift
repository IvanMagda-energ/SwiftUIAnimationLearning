
//  RowView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.


import SwiftUI

struct RowView: View {
    let title: String
    
    private let viewHeight: CGFloat = 50
    private let cornerRadius: CGFloat = 15
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
        }
        .frame(height: viewHeight)
        .padding()
        .background(Color.random)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    RowView(title: "Example row")
}
