//
//  Triggers_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 27.11.20.
//

import SwiftUI

struct Triggers_Exercise: View {
    @State private var showPopup = false
    @GestureState private var popupOffset = CGSize.zero

    var body: some View {
        ZStack {
            VStack {
                TitleText("Triggers")
                SubtitleText("Show Popup")

                Spacer()

                Button("Show Popup") {
                    showPopup.toggle()
                }
                .padding()
            }
            .font(.title)
            .padding()
            .blur(radius: showPopup ? 2 : 0)
            .animation(.easeOut)

            if showPopup {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showPopup = false
                        }

                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                        Spacer()
                        Text("You can also tap outside of the popup to close")
                        Spacer()
                        Button("Or Tap this Button to Close") {
                            showPopup.toggle()
                        }
                        .padding(.bottom)
                    }
                    .frame(height: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                    .offset(popupOffset)
                    .gesture(
                        DragGesture(minimumDistance: 100)
                            .updating($popupOffset, body: { (value, popupOffset, transaction) in
                                popupOffset = value.translation
                            })
                            .onEnded({ (value) in
                                self.showPopup = false
                            })
                    )
                }
                .animation(.default)
            }
        }
        .animation(.easeIn)

    }
}

struct Triggers_Exercise_Previews: PreviewProvider {
    static var previews: some View {
        Triggers_Exercise()
    }
}
