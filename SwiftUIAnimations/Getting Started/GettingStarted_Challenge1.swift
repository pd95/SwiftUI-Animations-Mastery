//
//  GettingStarted_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI

struct GettingStarted_Challenge1: View {
    @State private var change = false
    var body: some View {
        VStack {
            TitleText("Challenge")
            SubtitleText("Move the Circle Shape")
            Spacer()
            HStack {
                Circle()
                    .foregroundColor(.blue)
                    .offset(x: change ? -150:150, y: change ? -150:150)
                    .frame(width: 50, height: 50, alignment: .center)
                    .animation(.easeInOut)
            }
            .frame(maxWidth: 300, maxHeight: 300)
            Spacer()

            Button("Change") {
                change.toggle()
            }
            .padding()
        }
        .padding()
    }
}

struct GettingStarted_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_Challenge1()
    }
}
