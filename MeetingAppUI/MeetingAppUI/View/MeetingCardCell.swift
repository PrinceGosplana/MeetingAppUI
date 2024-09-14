//
//  MeetingCardCell.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct MeetingCardCell: View {
    
    @Binding var meeting: Meeting

    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(meeting.timing.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                    Text(meeting.title)
                        .font(.title2.bold())

                    Text("\(meeting.members.count) Members joining")
                        .font(.caption)
                }

                Spacer(minLength: 0)
                /// Custom toggle
                ZStack(alignment: meeting.turnedOn ? .trailing : .leading) {
                    Capsule()
                        .fill(.secondary)
                        .foregroundStyle(.white)
                        .frame(width: 35, height: 18)

                    Circle()
                        .fill(.white)
                        .frame(width: 18, height: 18)
                }
                .shadow(radius: 1.5)
                .onTapGesture {
                    withAnimation {
                        meeting.turnedOn.toggle()
                    }
                }
            }
            .foregroundStyle(getColor())

            HStack(spacing: 0) {
                ForEach(1...3, id: \.self) { index in
                    Image("user\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .padding(4)
                        .background(.white, in: Circle())
                        .background(
                            Circle()
                                .stroke(.black, lineWidth: 1)
                        )
                }

                Spacer(minLength: 15)

                Button {

                } label: {
                    Text("Join")
                        .foregroundStyle(.black)
                        .padding(.horizontal, 10)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.small)
                .tint(.white)
                .shadow(radius: 1.2)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(meeting.cardColor, in: RoundedRectangle(cornerRadius: 12))
    }

    private func getColor() -> Color {
        if meeting.cardColor == Color("Purple") || meeting.cardColor == Color("Red") {
            return .white
        }
        return .black
    }
}

#Preview {
    MeetingCardCell(meeting: .constant(Meeting.mockModels[0]))
}
