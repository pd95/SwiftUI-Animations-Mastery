//
//  AnimationOptions_Challenge2.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 27.11.20.
//

import SwiftUI

struct AnimationOptions_Challenge2: View {

    let circleWidth: CGFloat = 60

    @State private var start = false

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark").opacity(0.9), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)

                VStack {
                    TitleText("CHALLENGE")
                        .foregroundColor(Color("Gold"))
                    SubtitleText("Recreate this Animation")
                        .foregroundColor(.gray)
                        .padding()

                    Spacer()


                    GeometryReader { proxy in
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.none) {
                                    start = false
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                                    start = true
                                }
                            }) {
                                Image(systemName: "arrow.right")
                                    .imageScale(.large)
                                    .foregroundColor(.black)
                                    .frame(width: circleWidth, height: circleWidth)
                                    .background(Circle().fill(Color.white))
                                    .overlay(
                                        Circle()
                                            .stroke(Color("Gold"), lineWidth: 5)
                                            .opacity(start ? 0 : 0.9)
                                            .scaleEffect(start ? 1.8 : 1.1)
                                            .animation(Animation.easeOut(duration: 1)
                                                        .repeatCount(5).delay(2.7))
                                    )
                                    .rotationEffect(.radians(Double(start ? 0 :  (-30-proxy.frame(in: .local).size.width) / circleWidth )))
                                    .offset(x: start ? 0 : -30-proxy.frame(in: .local).size.width)
                                    .animation(Animation.linear(duration: 1).delay(1.5))
                            }
                            .border(Color.blue)
                        }
                        .border(Color.gray)
                    }
                    .frame(maxHeight: circleWidth)
                    .border(Color.yellow)
                }
                .padding()

                Text("Welcome!")
                    .foregroundColor(Color("Gold"))
                    .opacity(start ? 1 : 0)
                    .animation(Animation.easeIn(duration: 1).delay(0.5))
        }
        .onAppear() {
            start = true
        }
        .font(Font.largeTitle.bold())
    }
}

struct AnimationOptions_Challenge2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Challenge2()
    }
}
