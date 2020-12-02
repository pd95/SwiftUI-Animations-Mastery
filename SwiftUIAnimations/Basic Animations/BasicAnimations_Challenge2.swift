//
//  BasicAnimations_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI

struct BasicAnimations_Challenge2: View {
    @State private var show = false

    var body: some View {
        VStack {
            TitleText("Challenge")
            SubtitleText("Show a Menu")
            VStack {
                Button("Open Menu") {
                    show.toggle()
                }

            }
            Spacer()
            VStack(spacing: 20)  {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .padding(.top, 8)

                Text("Menu")
                Spacer()
            }
            .foregroundColor(.white)
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
            .scaleEffect(show ? 1 : 0.2)
            .offset(y: show ? 50 : 280)
            .opacity(show ? 1 : 0)
            .animation(.default)
            .padding()
            .edgesIgnoringSafeArea(.bottom)
        }
        .padding()
    }
}

struct BasicAnimations_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge2()
    }
}
