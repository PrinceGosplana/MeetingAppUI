//
//  TabButton.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 13.09.2024.
//

import SwiftUI

struct TabButton: View {
    @Binding var currentTab: String
    let title: String

    /// bottom indicator slide animation
    var animationID: Namespace.ID

    var body: some View {
        Button {
            withAnimation(.spring()) {
                currentTab = title
            }
        }label: {
            VStack {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(currentTab == title ? .black : .gray)

                if currentTab == title {
                    Rectangle()
                        .fill(.black)
                        .matchedGeometryEffect(id: "TAB", in: animationID)
                        .frame(width: 50, height: 1)
                } else {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 50, height: 1)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
