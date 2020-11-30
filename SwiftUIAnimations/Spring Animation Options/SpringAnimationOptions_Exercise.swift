//
//  SpringAnimationOptions_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 29.11.20.
//

import SwiftUI

struct SpringAnimationOptions_Exercise: View {

    @State private var start = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]),
                startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 40) {
                Image("KluaneNationalPark")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .padding(.vertical, 80)
                    .offset(x: start ? 0 : 400)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3))

                Text("PLANET EXPLORER")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))
                    .offset(x: start ? 0 : -400)
                    .animation(Animation.interpolatingSpring(stiffness: 40, damping: 8).delay(0.3))


                VStack {
                    Text("START")
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(0.9))
                    Text("EXPLORING!")
                        .scaleEffect(start ? 1 : 0.2)
                        .opacity(start ? 1 : 0)
                        .animation(Animation.interpolatingSpring(stiffness: 25, damping: 5, initialVelocity: 10).delay(1.3))
                }
                .font(.title)
                .foregroundColor(Color("LightAccent2"))

                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .accentColor(Color("LightShade2"))
                        .padding(25)
                        .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                        .opacity(start ? 1 : 0)
                        .animation(Animation.linear(duration: 1.6).delay(0.3))
                }
            }
            .onAppear() {
                start.toggle()
            }
        }
    }
}

struct SpringAnimationOptions_Exercise_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimationOptions_Exercise()
    }
}
