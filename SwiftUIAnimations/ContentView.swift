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
                Group {
                    NavigationLink(
                        destination: GettingStarted_Challenge1(),
                        label: {
                            Text("Getting Started: Challenge 1")
                        }
                    )
                    NavigationLink(
                        destination: GettingStarted_Challenge2(),
                        label: {
                            Text("Getting Started: Challenge 2")
                        }
                    )

                    NavigationLink(
                        destination: BasicAnimations_Exercise(),
                        label: {
                            Text("Basic Animations: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: BasicAnimations_Challenge1(),
                        label: {
                            Text("Basic Animations: Challenge 1")
                        }
                    )
                    NavigationLink(
                        destination: BasicAnimations_Challenge2(),
                        label: {
                            Text("Basic Animations: Challenge 2")
                        }
                    )

                    NavigationLink(
                        destination: Triggers_Exercise(),
                        label: {
                            Text("Triggers: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: Triggers_Challenge1(),
                        label: {
                            Text("Triggers: Challenge 1")
                        }
                    )
                }

                Group {
                    NavigationLink(
                        destination: AnimationOptions_Exercise(),
                        label: {
                            Text("Animation Options: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: AnimationOptions_Challenge1(),
                        label: {
                            Text("Animation Options: Challenge 1")
                        }
                    )
                    NavigationLink(
                        destination: AnimationOptions_Challenge2(),
                        label: {
                            Text("Animation Options: Challenge 2")
                        }
                    )

                    NavigationLink(
                        destination: SpringAnimationOptions_Exercise(),
                        label: {
                            Text("Spring Animation Options: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: SpringAnimationOptions_Challenge1(),
                        label: {
                            Text("Spring Animation Options: Challenge 1")
                        }
                    )

                    NavigationLink(
                        destination: Transitions_Exercise(),
                        label: {
                            Text("Transitions: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: Transitions_Challenge1(),
                        label: {
                            Text("Transitions: Challenge 1")
                        }
                    )
                    NavigationLink(
                        destination: Transitions_Challenge2(),
                        label: {
                            Text("Transitions: Challenge 2")
                        }
                    )
                }

                Group {
                    NavigationLink(
                        destination: CustomTimingCurve_Exercise(),
                        label: {
                            Text("Custom Timing Curve: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: CustomTimingCurve_Challenge1(),
                        label: {
                            Text("Custom Timing Curve: Challenge 1")
                        }
                    )

                    NavigationLink(
                        destination: MatchedGeometryEffect_Exercise(),
                        label: {
                            Text("Matched Geometry Effect: Exercise")
                        }
                    )
                    NavigationLink(
                        destination: MatchedGeometryEffect_Challenge1(),
                        label: {
                            Text("Matched Geometry Effect: Challenge")
                        }
                    )
                }
            }
            .navigationBarTitle("SwiftUI Animation Mastery", displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
