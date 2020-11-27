//
//  Triggers_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 27.11.20.
//

import SwiftUI

private let description = """
Kluane National Park and Reserve is in the southwest of the Yukon, in Canada. It’s a vast wilderness of ice fields, forests and towering peaks like Mount Logan. Trails include the King’s Throne, which winds above Kathleen Lake to a dramatic view. The Alsek River travels through areas inhabited by grizzly bears.
"""

struct Triggers_Challenge1: View {
    @State private var showText = false
    @GestureState private var textOffset = CGSize.zero

    private let shrinkableHeight: CGFloat = 280

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Text("Kluane National Park")
                    .bold()
                    .padding()

                Image("KluaneNationalPark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .padding(10)
                    .frame(width: proxy.size.width, height: 200 + textOffset.height + (showText ? 0 : shrinkableHeight))

                VStack(spacing: 0) {
                    Button(action: { showText.toggle() }) {
                        Image(systemName: "chevron.compact.up")
                            .imageScale(.large)
                            .rotationEffect(.degrees(showText ? 180 : 0))
                            .padding()
                    }

                    Text(description)
                        .gesture(DragGesture(minimumDistance: 5)
                                    .updating($textOffset, body: { (value, offset, transaction) in
                                        //offset = value.translation
                                        offset.height = min(max(0, value.translation.height), shrinkableHeight)
                                    })
                                    .onEnded({ (value) in
                                        if value.translation.height > 50 {
                                            showText = false
                                        }
                                        else if value.translation.height < -50 {
                                            showText = true
                                        }
                                    })
                        )
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .offset(y: textOffset.height)
            }
            .animation(.easeOut)
        }
        .edgesIgnoringSafeArea(.bottom)
        .font(.title)
    }
}

struct Triggers_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Triggers_Challenge1()
    }
}
