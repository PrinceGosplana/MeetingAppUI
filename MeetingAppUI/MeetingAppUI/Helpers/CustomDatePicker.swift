//
//  CustomDatePicker.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct CustomDatePicker: View {

    @Binding var date: Date
    @Binding var showPicker: Bool

    var body: some View {
        ZStack {
            /// Blur effect
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()

            DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .labelsHidden()

            Button {
                withAnimation {
                    showPicker.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.gray, in: Circle())
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .opacity(showPicker ? 1 : 0)
    }
}

#Preview {
    CustomDatePicker(date: .constant(Date()), showPicker: .constant(true))
}
