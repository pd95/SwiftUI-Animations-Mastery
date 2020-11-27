//
//  BasicAnimations_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI

struct BasicAnimations_Exercise: View {
    @State private var change = false

    var offsetValue: CGFloat = 200

    var body: some View {
        VStack {
            TitleText("Exercise Logo")
            //SubtitleText("Logo ")

            Spacer()
            // Logo Composition
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .offset(x: change ? 0 : -offsetValue)
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .offset(y: change ? 0 : -offsetValue)
                }
                .offset(x: -18)

                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .offset(y: change ? 0 : offsetValue)
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .offset(x: change ? 0 : offsetValue)
                }
                .offset(x: 18)
            }
            .rotationEffect(.degrees(change ? 0 : -90))
            .foregroundColor(change ? .red : .orange)
            .opacity(change ? 1 : 0)
            .animation(.default)

            Spacer()

            Button("Change") {
                change.toggle()
            }
            .padding()
        }
        .padding()

    }
}

struct Excercise3_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Exercise()
    }
}
