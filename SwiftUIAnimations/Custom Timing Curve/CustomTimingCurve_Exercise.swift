//
//  CustomTimingCurve_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct CustomTimingCurve_Exercise: View {
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)

    @State private var showMenus = true

    var body: some View {
        ZStack {
            backgroundGradient.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            TitleView()

            Group {
                MenusView(showMenus: $showMenus)

                WelcomeBackView(showMenus: $showMenus)
            }
            .offset(y: 50)
        }
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }
}

struct CustomTimingCurve_Exercise_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimingCurve_Exercise()
    }
}

struct MenusView: View {

    @Binding var showMenus: Bool
    var blurRadius: CGFloat = 4

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                VStack(spacing: 25) {
                    Text("Stats")
                        .fontWeight(.thin)
                        .padding()
                    Button(action: {}) {
                        Image("stopwatch")
                    }
                    Button(action: {}) {
                        Image("heart.rate")
                    }
                    Button(action: {}) {
                        Image("scale")
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 500)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            Color("Background4")
                                .opacity(0.95)
                        )
                        .shadow(radius: 8)
                )
                .scaleEffect(showMenus ? 1 : 0.8)
                .blur(radius: showMenus ? 0 : blurRadius)
                .offset(x: showMenus ? 0 : -90)
                .animation(
                    showMenus ?
                        .timingCurve(0, -2, 1, 0, duration: 1) :
                        .timingCurve(0, 1, 0, 1.5, duration: 1)
                )

                VStack(spacing: 25) {
                    Text("Exercise")
                        .fontWeight(.thin)
                        .padding()
                    Button(action: {}) {
                        Image("jump.rope")
                    }
                    Button(action: {}) {
                        Image("dumbbell")
                    }
                    Button(action: {}) {
                        Image("kettlebell")
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 500)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            Color("Background4")
                                .opacity(0.95)
                        )
                        .shadow(radius: 8)
                )
                .scaleEffect(showMenus ? 1 : 0.8)
                .blur(radius: showMenus ? 0 : blurRadius)
                .offset(x: showMenus ? 0 : 90)
                .animation(
                    showMenus ?
                        .timingCurve(0, -2, 1, 0, duration: 1) :
                        .timingCurve(0, 1, 0, 1.5, duration: 1)
                )

            }

            Button(action: {
                showMenus.toggle()
            }) {
                Text("Done")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
            }
            .offset(y: showMenus ? 0 : 300)
            .blur(radius: showMenus ? 0 : blurRadius)
            .animation(.easeIn(duration: 1))
        }
        .padding(.horizontal)
        .zIndex(showMenus ? 1 : 0)
        .buttonStyle(ButtonStyleLightOutline())
    }
}

struct WelcomeBackView: View {

    @Binding var showMenus: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome Back,")
                .fontWeight(.thin)
                .padding(.top)
            Text("Jaqueline")
                .fontWeight(.bold)
                .font(.largeTitle)
            
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            
            Spacer()
            
            Button(action: {
                    showMenus.toggle()
            }) {
                Text("See Details")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(ButtonStyleLightOutline())
            .padding()
        }
        .frame(width: 300, height: 600)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Secondary4"))
                .shadow(radius: 8)
        )
        .scaleEffect(showMenus ? 0.7 : 1)
        .blur(radius: showMenus ? 5 : 0)
        .animation(showMenus ?
            Animation.easeInOut(duration: 1).delay(0.1) :
                    .timingCurve(0.5, 0, 0.5, 1.5, duration: 1)
        )
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Workout Pro")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top, 20)
            Spacer()
        }
    }
}
