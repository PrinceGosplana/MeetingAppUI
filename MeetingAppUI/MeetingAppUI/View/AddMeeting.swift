//
//  AddMeeting.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct AddMeeting: View {
    
    @EnvironmentObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 20) {

            header()

            meetingName()
            .padding(.top, 10)

            timing()
            .padding(.top, 10)

            collaborators()
            .padding(.top, 10)

            meetingType()
            .padding(.top, 10)

            meetingCardColor()
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 10)

            Button {
                addMeeting()
            } label: {
                Text("Schedule")
                    .foregroundStyle(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 30)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.small)
            .tint(.black)
            .padding(.bottom, 10)
            .disabled(viewModel.currentMeetingData.title == "")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.bg)
        .overlay(CustomDatePicker(date: $viewModel.currentMeetingData.timing, showPicker: $viewModel.showDatePicker))
        .transition(.move(edge: .bottom))
    }

    private func addMeeting() {
        viewModel.meetings.append(viewModel.currentMeetingData)
        viewModel.addNewMeeting.toggle()
    }

    @ViewBuilder
    private func header() -> some View {
        HStack {
            Button {
                withAnimation {
                    viewModel.addNewMeeting.toggle()
                }
            } label: {
                Image(systemName: "xmark")
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
    }

    @ViewBuilder
    private func meetingName() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Enter Meeting name")
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

            TextField("Name", text: $viewModel.currentMeetingData.title)
                .font(.system(size: 18).bold())

            Divider()
        }
    }

    @ViewBuilder
    private func timing() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Timing")
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

            HStack {
                Text("\(viewModel.currentMeetingTime), \(viewModel.currentMeetingDate)")
                    .fontWeight(.bold)

                Spacer(minLength: 10)

                /// Custom Date Picker
                Button {
                    withAnimation {
                        viewModel.showDatePicker.toggle()
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
    }

    @ViewBuilder
    private func collaborators() -> some View {
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
    }

    @ViewBuilder
    private func meetingType() -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Meeting Type")
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

            HStack(spacing: 20) {
                ForEach(viewModel.meetingType, id: \.self) { tab in
                    MeetingTabButton(title: tab, currentType: $viewModel.currentMeetingType)
                }
            }
            Divider()
        }
    }

    @ViewBuilder
    private func meetingCardColor() -> some View {
        VStack(alignment: .leading, spacing: 15) {

            Text("Meeting card color")
                .fontWeight(.semibold)
                .foregroundStyle(.gray)

            HStack(spacing: 12) {
                ForEach(viewModel.colors, id:\.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "checkmark")
                                .foregroundStyle(.white)
                                .opacity(
                                    viewModel.currentMeetingData.cardColor == color ? 1 : 0
                                )
                        )
                        .onTapGesture {
                            viewModel.currentMeetingData.cardColor = color
                        }
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
