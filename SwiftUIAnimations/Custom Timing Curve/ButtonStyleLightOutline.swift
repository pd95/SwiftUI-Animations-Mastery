//
//  ButtonStyleLightOutline.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct ButtonStyleLightOutline: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color("Accent4"))
                    .opacity(0.1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("Accent4"), lineWidth: 0.7)
            )
    }
}

struct ButtonStyleLightOutline_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Secondary4")
                .edgesIgnoringSafeArea(.all)

            Button("Test how the button looks") { }
                .buttonStyle(ButtonStyleLightOutline())
        }
    }
}
