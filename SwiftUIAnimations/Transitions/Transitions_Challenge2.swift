//
//  Transitions_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct Transitions_Challenge2: View {
    @State private var show = false
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            Color("Background3")
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image(systemName: "bed.double.fill")
                    .font(.system(size: 100))
                    .foregroundColor(Color("Tertiary3"))
                    .padding(20)

                Spacer()

                VStack(spacing: 30) {
                    if show {
                        Text("Welcome back, friend")
                            .foregroundColor(Color("Secondary3"))
                            .font(.title)
                            .transition(AnyTransition.move(edge: .top)
                                            .combined(with: .opacity))

                        TextField("Username", text: $username)
                            .transition(AnyTransition.move(edge: .leading)
                                            .combined(with: .opacity))
                        SecureField("Password", text: $password)
                            .transition(AnyTransition.move(edge: .trailing)
                                            .combined(with: .opacity))

                        Button(action: {
                            show.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                                show.toggle()
                            }
                        }) {
                            Text("come in")
                                .font(.headline)
                                .padding()
                                .background(Color("Accent3"))
                                .shadow(radius: 10)
                        }
                        .transition(AnyTransition.move(edge: .bottom)
                                        .combined(with: .opacity))
                    }
                }
                .foregroundColor(Color("LightShade2"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                Spacer()

                Image("person.sleeping")
                Spacer()
            }
            .padding()
            .animation(.easeIn(duration: 1))
            .onAppear(perform: {
                show.toggle()
            })
        }
    }
}

struct Transitions_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        Transitions_Challenge2()
    }
}
