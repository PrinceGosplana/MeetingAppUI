//
//  MeetingTabButton.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 14.09.2024.
//

import SwiftUI

struct MeetingTabButton: View {

    var title: String
    @Binding var currentType: String

    var body: some View {
        Button {
            withAnimation {
                currentType = title
            }
        } label: {
            Text(title)
                .font(.footnote)
                .foregroundStyle(title != currentType ? .black : .white)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(
                    Capsule()
                        .stroke(.black, lineWidth: 1)
                )
                .background(
                    Capsule()
                        .fill(.black.opacity(title == currentType ? 1 : 0))
                )
        }
    }
}
 
