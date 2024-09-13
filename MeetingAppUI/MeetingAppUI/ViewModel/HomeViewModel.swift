//
//  HomeViewModel.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var meetings: [Meeting] = Meeting.mockModels
}
