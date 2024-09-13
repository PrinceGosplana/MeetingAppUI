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
    var cardColor: Color = Color(.blue)
    var turnedOn: Bool = true
    var memberType: String = "Public"
}
