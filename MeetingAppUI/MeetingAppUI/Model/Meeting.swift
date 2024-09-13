//
//  Meeting.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct Meeting: Identifiable {
    let id = UUID().uuidString
    var title: String
    var timing: Date
    var cardColor: Color = Color("Blue")
    var turnedOn: Bool = true
    var memberType: String = "Public"
    var members: [String] = Array(repeating: "", count: 10)

    var meetingTime: String {
        timing.formatted(date: .omitted, time: .shortened)
    }

    var meetingDate: String {
        timing
            .formatted(date: .abbreviated, time: .omitted)
    }
}

extension Meeting {
    static let mockModels: [Meeting] = [
        .init(title: "Mouse issue", timing: Date()),
        .init(title: "Bug fixing", timing: Date())
    ]
}
