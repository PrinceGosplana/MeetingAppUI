//
//  Home.swift
//  MeetingAppUI
//
//  Created by Oleksandr Isaiev on 11.09.2024.
//

import SwiftUI

struct Home: View {
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
                    
                }
            }
            .padding()
        }
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    Home()
}
