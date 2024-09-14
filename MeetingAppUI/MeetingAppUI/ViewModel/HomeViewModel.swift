//
//  HomeViewModel.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    let colors = [Color("Blue"), Color("Green"), Color("Orange"), Color("Purple"), Color("Red")]
    let tabs = ["Upcoming", "On Hold", "Post", "Cancelled"]
    @Published var addNewMeeting = false
    @Published var currentMeetingType = "Public"
    @Published var currentTab = "Upcoming"
    @Published var meetings: [Meeting] = [] // Meeting.mockModels
    let meetingType = ["Private", "Public", "On Invite"]
    @Published var currentMeetingData = Meeting(title: "", timing: Date())
    @Published var showDatePicker = false

    var currentMeetingTime: String {
        currentMeetingData.meetingTime
    }

    var currentMeetingDate: String {
        currentMeetingData.meetingDate
    }
}
