//
//  Transitions_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct Transitions_Challenge1: View {

    @State private var start = false

    var body: some View {

        ZStack(alignment: .bottom) {
            if start {
                VStack(spacing: 20) {
                    Text("explore")
                    Text("T H E   G R E A T   D E S E R T")
                        .font(.system(size: 24, design: .serif))
                    Button(action: {
                        start.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                            start.toggle()
                        }
                    }, label: {
                        Text("EXPERIENCE")
                            .padding(10)
                            .background(Capsule().stroke(lineWidth: 2))
                    })
                }
                .font(.system(.body, design: .serif))
                .transition(AnyTransition.move(edge: .bottom))
                .animation(Animation.easeOut(duration: 1.8))
                .padding(.bottom, 210)
            }

            VStack {
                Text("Desert Life")
                    .font(.system(.largeTitle, design: .serif))
                Spacer()
                if start {
                    Image("desert")
                        .transition(.move(edge: .bottom))
                        .animation(Animation.easeOut(duration: 1).delay(0.6))
                }
            }
            .padding(.top)
        }
        .accentColor(Color("Gold"))
        .onAppear() {
            start = true
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Transitions_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Transitions_Challenge1()
    }
}
