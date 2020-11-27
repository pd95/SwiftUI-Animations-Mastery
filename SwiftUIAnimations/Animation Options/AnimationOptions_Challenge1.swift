//
//  AnimationOptions_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 27.11.20.
//

import SwiftUI

struct AnimationOptions_Challenge1: View {

    @State private var showSlideOut = false
    @State private var showButtons = false

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)

                VStack {
                    TitleText("CHALLENGE")
                        .foregroundColor(Color("Gold"))
                    SubtitleText("Recreate this Animation")
                        .foregroundColor(.gray)

                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(Color("Dark"))

                    GeometryReader { proxy in
                        HStack(spacing: 0) {

                            ScrollView(.horizontal, showsIndicators: true) {
                                ScrollViewReader { reader in
                                    HStack {
                                        Button(action: toggleSlideOut) {
                                            Image(systemName: "trash")
                                                .padding()
                                                .frame(maxHeight: .infinity)
                                                .background(Color.red)
                                        }
                                        .id(9)
                                        
                                        Button(action: toggleSlideOut) {
                                            Image(systemName: "pencil")
                                                .padding()
                                                .frame(maxHeight: .infinity)
                                        }
                                        
                                        Button(action: toggleSlideOut) {
                                            Image(systemName: "scribble")
                                                .padding()
                                                .frame(maxHeight: .infinity)
                                        }
                                        
                                        Button(action: toggleSlideOut) {
                                            Image(systemName: "lasso")
                                                .padding()
                                                .frame(maxHeight: .infinity)
                                        }

                                        Button(action: toggleSlideOut) {
                                            Image(systemName: "scissors")
                                                .padding()
                                                .frame(maxHeight: .infinity)
                                        }
                                        .id(1)
                                    }
                                    .onChange(of: showButtons, perform: { value in
                                        print("scrolling")
                                        if value {
                                            reader.scrollTo(1, anchor: .trailing)
                                        }
                                    })
                                }
                            }
                            .opacity(showButtons ? 1 : 0)
                            .background(Color("Gold"))

                            Button(action: toggleSlideOut) {
                                Image(systemName: "line.horizontal.3.decrease")
                                    .rotationEffect(.degrees(270))
                                    .padding()
                                    .frame(width: 45)
                                    .frame(maxHeight: .infinity)
                            }
                        }
                        .foregroundColor(Color("Accent"))
                        .background(Capsule()
                                        .fill(Color("Gold")))
                        .offset(x: (showSlideOut ? 0 : 26-proxy.frame(in: .local).width))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 66)
                    .padding(.top)
                }
                .font(.title)
                .padding()
        }
    }

    func toggleSlideOut() {
        print("Button pressed")
        withAnimation(Animation.easeIn(duration: 0.2)) {
            showSlideOut.toggle()
        }
        if showSlideOut {
            withAnimation(Animation.default.delay(0.2)) {
                showButtons = true
            }
        }
        else {
            showButtons = false
        }
    }
}

struct AnimationOptions_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Challenge1()
    }
}
