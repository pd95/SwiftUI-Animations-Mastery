//
//  AnimationOptions_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 27.11.20.
//

import SwiftUI

struct AnimationOptions_Exercise: View {

    @State private var showLogin = false
    @State private var shouldAnimate = true
    @State private var username = ""
    @State private var password = ""

    let xOffset: CGFloat = -200
    let duration = 0.7
    let delay = 0.5

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Exercise")
                    .foregroundColor(Color("Gold"))
                    .font(.custom("DIN Condensed Bold", size: 70))
                Text("Show Login")
                    .foregroundColor(.gray)
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70))
                        .padding()
                        .foregroundColor(Color("Gold"))

                        .scaleEffect(showLogin ? 1 : 4)
                        .animation(Animation.easeIn(duration: duration).speed(1.5).delay(delay), value: shouldAnimate)

                    TextField("Username", text: $username)
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(Animation.easeIn(duration: duration).delay(delay+0.2), value: shouldAnimate)

                    SecureField("Password", text: $password)
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : -200)
                        .animation(Animation.easeIn(duration: duration).delay(delay+0.4), value: shouldAnimate)

                    Button("Login") {
                        showLogin.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            shouldAnimate.toggle()
                            showLogin = true
                        }
                    }
                    .foregroundColor(Color("Accent"))
                    .opacity(showLogin ? 1 : 0)
                    .offset(x: showLogin ? 0 : -200)
                    .animation(Animation.easeIn(duration: duration).delay(delay+0.6), value: shouldAnimate)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .onAppear() {
                    showLogin = true
                    shouldAnimate.toggle()
                }

                Spacer()
                Spacer()
            }
            .font(.title)
        }
    }
}

struct AnimationOptions_Excercise_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Exercise()
    }
}
