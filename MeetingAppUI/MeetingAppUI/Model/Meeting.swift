//
//  Meeting.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct Meeting: Identifiable {
    let id = UUID().uuidString
    let title: String
    let timing: Date
    var cardColor: Color = Color("Blue")
    var turnedOn: Bool = true
    var memberType: String = "Public"
    var members: [String] = Array(repeating: "", count: 10)
}

extension Meeting {
    static let mockModels: [Meeting] = [
        .init(title: "Mouse issue", timing: Date()),
        .init(title: "Bug fixing", timing: Date())
    ]
}
