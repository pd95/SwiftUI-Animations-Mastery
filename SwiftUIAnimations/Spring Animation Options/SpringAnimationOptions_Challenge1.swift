//
//  SpringAnimationOptions_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 29.11.20.
//

import SwiftUI

struct SpringAnimationOptions_Challenge1: View {

    var imageNames = ["undraw_tutorial_video_vtd1", "undraw_source_code_xx2e", "undraw_winners_ao2o"]
    var text = ["Learn by watching videos and looking at code.",
                "Step-by-step exercises,\nquizzes and practical\nchallenges.",
                "Master SwiftUI Animations\nToday!"]

    @State private var selected = 0

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]),
                startPoint: .topTrailing, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 40) {
                Text("Welcome to")
                    .font(.largeTitle)
                    .foregroundColor(Color("LightShade2"))
                Text("SwiftUI Animations")
                    .font(.largeTitle).bold()
                    .foregroundColor(Color("LightShade2"))

                Spacer()

                GeometryReader { proxy in
                    let size = proxy.frame(in: .global).size
                    ZStack {
                        ForEach(imageNames.indices) { i in
                            VStack {
                                Image(imageNames[i])
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: CGFloat(i - selected) * size.width)
                                    .animation(Animation.interpolatingSpring(stiffness: 10, damping: 5, initialVelocity: 3))

                                Text(text[i])
                                    .font(.title)
                                    .foregroundColor(Color("LightAccent2"))
                                    .multilineTextAlignment(.center)
                                    .offset(x: CGFloat(i - selected) * size.width)
                                    .animation(Animation.interpolatingSpring(stiffness: 10, damping: 5, initialVelocity: 3).delay(0.1))
                            }
                            .padding(40)
                            .frame(width: size.width)
                        }
                    }
                }

                Spacer()

                HStack(spacing: 30) {
                    ForEach(text.indices) { i in
                        Button(action: { selected = i }) {
                            Text("\(i+1)")
                                .font(.title)
                                .accentColor(Color("LightShade2"))
                                .padding(15)
                                .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                                .scaleEffect(selected == i ? 1 : 0.2)
                                .animation(Animation.interpolatingSpring(stiffness: 30, damping: 7, initialVelocity: 8))
                        }
                    }
                }

                Button(action: {}) {
                    HStack {
                        Text("Continue ")
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                }
                .accentColor(Color("LightShade2"))
                .background(Capsule().fill(Color("Accent2")).shadow(radius: 10))
                .scaleEffect(selected == text.count - 1 ? 1 : 0.2)
                .opacity(selected == text.count - 1 ? 1 : 0)
                .animation(Animation.interpolatingSpring(stiffness: 50, damping: 7, initialVelocity: 7))
            }
        }
    }
}

struct SpringAnimationOptions_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        SpringAnimationOptions_Challenge1()
    }
}
