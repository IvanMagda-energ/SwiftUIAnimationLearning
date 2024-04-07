//
//  MessageCardView.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct MessageCardView: View {
    var message: Message
    
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .fill(message.tintColor)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(message.userName)
                    .fontWeight(.bold)
                
                Text(message.message)
                    .foregroundStyle(.secondary)
            }
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    MessageCardView(message: MockMessage.preparedMessage)
}
