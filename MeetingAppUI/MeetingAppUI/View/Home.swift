//
//  Home.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 11.09.2024.
//

import SwiftUI

struct Home: View {

    @Namespace var animationID
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                Text("Hi, there!")
                    .font(.title3)
                    /// letter spacing
                    .kerning(1.1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)

                HStack {
                    Text("Check your\n**Meeting Details**")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)

                    Button {
                        withAnimation {
                            viewModel.addNewMeeting.toggle()
                        }
                    } label: {
                        Text("ADD")
                            .foregroundStyle(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(
                                Capsule()
                                    .stroke(.black, lineWidth: 1)
                            )
                    }
                }
                .padding(.top, 8)

                /// Custom segment tab view
                HStack(spacing: 8) {
                    ForEach(viewModel.tabs, id:\.self) {
                        TabButton(currentTab: $viewModel.currentTab, title: $0, animationID: animationID)
                    }
                }
                .padding(.top, 25)

                if viewModel.meetings.isEmpty {
                    Image(.notes)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.top, 30)

                    Text("Add **Meeting**")
                        .font(.title2)
                        .padding(.top)
                }
                VStack(spacing: 15) {
                    ForEach($viewModel.meetings) { $meeting in
                        MeetingCardCell(meeting: $meeting)
                    }
                }
            }
            .padding()
        }
        .background(Color.bg)
        .ignoresSafeArea()
        .overlay(
            ZStack {
                if viewModel.addNewMeeting {
                    AddMeeting().environmentObject(viewModel)
                }
            }
        )
    }
}

#Preview {
    Home()
}
