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
    @State private var showDatePicker = false

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

                        Spacer(minLength: 10)

                        /// Custom Date Picker
                        Button {
                            withAnimation {
                                showDatePicker.toggle()
                            }
                        } label: {
                            Image(systemName: "calendar")
                                .foregroundStyle(.black)
                                .padding(6)
                                .background(.yellow, in: Circle())
                        }
                    }

                    Divider()
                }
                .padding(.top, 10)

                VStack(alignment: .leading, spacing: 15) {
                    Text("Select Collaborators")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)

                    HStack(spacing: -10) {
                        ForEach(1...3, id: \.self) { index in
                            Image("user\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(4)
                                .background(.white, in: Circle())
                                .background(
                                    Circle()
                                        .stroke(.black, lineWidth: 1)
                                )
                        }

                        Spacer(minLength: 10)

                        Button {

                        } label: {
                            Text("Contacts")
                                .font(.caption)
                                .foregroundStyle(.black)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(
                                    Capsule().stroke(.black, lineWidth: 1)
                                )
                        }
                    }
                    Divider()
                }
                .padding(.top, 10)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.bg)
            .overlay(CustomDatePicker(date: $currentMeetingData.timing, showPicker: $showDatePicker))
        }
    }
}

#Preview {
    ContentView()
}
