//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: GettingStarted_Challenge1(),
                    label: {
                        Text("GettingStarted_Challenge1")
                    }
                )
                NavigationLink(
                    destination: GettingStarted_Challenge2(),
                    label: {
                        Text("GettingStarted_Challenge2")
                    }
                )
                NavigationLink(
                    destination: BasicAnimations_Challenge1(),
                    label: {
                        Text("BasicAnimations_Challenge1")
                    }
                )
                NavigationLink(
                    destination: BasicAnimations_Challenge2(),
                    label: {
                        Text("BasicAnimations_Challenge2")
                    }
                )
                NavigationLink(
                    destination: Triggers_Challenge1(),
                    label: {
                        Text("Triggers_Challenge1")
                    }
                )
                NavigationLink(
                    destination: AnimationOptions_Challenge1(),
                    label: {
                        Text("AnimationOptions_Challenge1")
                    }
                )
                NavigationLink(
                    destination: AnimationOptions_Challenge2(),
                    label: {
                        Text("AnimationOptions_Challenge1")
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
