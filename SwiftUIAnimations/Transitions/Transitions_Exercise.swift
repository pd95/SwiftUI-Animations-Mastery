//
//  Transitions_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct Transitions_Exercise: View {

    @State private var step1 = true

    var body: some View {
        ZStack {
            Color("Background3")

            VStack(spacing: 60) {
                Spacer()

                if step1 {
                    Text("Ready to travel?")
                        .bold()
                        .foregroundColor(Color("Secondary3"))
                        .transition(AnyTransition.move(edge: .leading))
                        .animation(.easeOut(duration: 1.1))
                }

                if step1 {
                    VStack(spacing: 60) {
                        Image("undraw_travel_plans_li01")
                            .resizable()
                            .scaledToFit()
                            .animation(.easeIn(duration: 1))

                        Capsule()
                            .fill(Color("Secondary3"))
                            .frame(height: 100)
                            .offset(x: -50)
                            .animation(.easeIn(duration: 0.6))
                            .overlay(
                                Text("Let's go!")
                                    .foregroundColor(Color("Foreground3"))
                                    .animation(.easeIn(duration: 0.6))
                            )
                    }
                    .transition(.move(edge: .leading))
                }
                Spacer()
            }
            VStack(spacing: 5) {
                if step1 == false {
                    Text("Where do you want to go?")
                        .bold()
                        .padding(.horizontal, 50)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Secondary3"))
                        .transition(.move(edge: .top))
                        .animation(.easeOut(duration: 0.8))
                }

                if step1 == false {
                    TripDetailsView()
                        .transition(.move(edge: .trailing))
                        .animation(.easeOut(duration: 1))
                }

                if step1 == false {
                    Image("undraw_aircraft_fbvl")
                        .resizable()
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        .scaledToFit()
                        .padding(.bottom, 100)
                        .transition(.move(edge: .bottom))
                        .animation(.easeOut(duration: 0.8))
                }
            }
            .padding(.top, 40)

            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                        step1.toggle()
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .rotationEffect(.degrees(step1 ? 180 : 0))
                    }

                    if step1 == false {
                        Button(action: {
                            step1.toggle()
                        }) {
                            Image(systemName: "chevron.right.circle.fill")
                        }
                        .transition(AnyTransition.move(edge: .trailing).combined(with: .opacity))
                    }
                }
                .font(.system(size: 50))
                .animation(.easeOut(duration: 1))
            }
            .padding(.bottom, 75)
        }
        .font(.largeTitle)
        .accentColor(Color("Accent3"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Transitions_Exercise_Previews: PreviewProvider {
    static var previews: some View {
        Transitions_Exercise() //TripDetailsView() //
    }
}

struct TripDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Destination:")
                .foregroundColor(Color("Foreground3"))
            Button(action: {}, label: {
                Text("Select")
                Spacer()
                Image(systemName: "chevron.right")
            })
            Text("Departure:")
                .foregroundColor(Color("Foreground3"))
            Button(action: {}, label: {
                Text("Today")
                Spacer()
                Image(systemName: "chevron.right")
            })
            Text("Return:")
                .foregroundColor(Color("Foreground3"))
            Button(action: {}, label: {
                Text("Tomorrow")
                Spacer()
                Image(systemName: "chevron.right")
            })
        }
        .padding(25)
        .background(RoundedRectangle(cornerRadius: 10))
        .accentColor(Color("Accent3"))
        .padding(40)
        .font(.body)
    }
}

