//
//  Message.swift
//  SwiftUIAnimationLearning
//
//  Created by Ivan Magda on 07.04.2024.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID().uuidString
    var message: String
    var userName: String
    var tintColor: Color
}
