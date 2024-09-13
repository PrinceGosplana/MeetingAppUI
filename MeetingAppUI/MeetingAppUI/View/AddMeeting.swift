//
//  AddMeeting.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct AddMeeting: View {
    
    @EnvironmentObject var homeModel: HomeViewModel
    @State private var currentMeetingData = Meeting(title: "", timing: Date())

    var body: some View {
        if !homeModel.addNewMeeting {
            VStack(spacing: 20) {
                HStack {
                    Button {

                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }

                    Spacer()

                    Image(.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .overlay(
                    Text("New Meeting")
                        .font(.system(size: 18))
                )

                VStack(alignment: .leading, spacing: 15) {
                    Text("Enter Meeting name")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)

                    TextField("Name", text: $currentMeetingData.title)
                        .font(.system(size: 18).bold())

                    Divider()
                }
                .padding(.top, 10)


                VStack(alignment: .leading, spacing: 15) {
                    Text("Timing")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)

                    HStack {
                        Text("\(currentMeetingData.meetingTime), \(currentMeetingData.meetingDate)")
                            .fontWeight(.bold)
                    }

                    Divider()
                }
                .padding(.top, 10)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.bg)
        }
    }
}

#Preview {
    ContentView()
}
