//
//  GettingStarted_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI

struct GettingStarted_Challenge2: View {
    @State private var change = false
    var body: some View {
        VStack {
            TitleText("Challenge")
            SubtitleText("Move the Circle Shape")
            Circle()
                .foregroundColor(.blue)
                .offset(x: 0, y: change ? 0 : 350)
                .frame(width: 100, height: 100, alignment: .center)
                .animation(.linear)

            Spacer()

            Button("Change") {
                change.toggle()
            }
            .padding()
        }
        .padding()
    }
}

struct GettingStarted_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_Challenge2()
    }
}
