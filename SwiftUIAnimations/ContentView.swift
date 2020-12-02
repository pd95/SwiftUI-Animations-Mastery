//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI


struct ContentView: View {

    struct ViewData: Hashable, Equatable, Identifiable {

        let id = UUID().uuidString
        let destination: AnyView
        let label: String
        let comment: String

        init(_ destination: AnyView, _ label: String, _ comment: String = "") {
            self.destination = destination
            self.label = label
            self.comment = comment
        }

        static func == (lhs: ContentView.ViewData, rhs: ContentView.ViewData) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }

    let views: [ViewData] = [
        ViewData(AnyView(GettingStarted_Challenge1()), "Getting Started: Challenge 1", "Move the Circle Shape"),
        ViewData(AnyView(GettingStarted_Challenge2()), "Getting Started: Challenge 2", "Move the Circle Shape"),
        ViewData(AnyView(BasicAnimations_Exercise()), "Basic Animations: Exercise", "Fly-in Logo"),
        ViewData(AnyView(BasicAnimations_Challenge1()), "Basic Animations: Challenge 1", "Show Login"),
        ViewData(AnyView(BasicAnimations_Challenge2()), "Basic Animations: Challenge 2", "Show Menu"),
        ViewData(AnyView(Triggers_Exercise()), "Triggers: Exercise", "Custom Popup"),
        ViewData(AnyView(Triggers_Challenge1()), "Triggers: Challenge", "Expandable Text: Kluane National Park"),
        ViewData(AnyView(AnimationOptions_Exercise()), "Animation Options: Exercise", "Advanced Show Login"),
        ViewData(AnyView(AnimationOptions_Challenge1()), "Animation Options: Challenge 1", "Custom Slide-in Menu"),
        ViewData(AnyView(AnimationOptions_Challenge2()), "Animation Options: Challenge 2", "Rolling Button"),
        ViewData(AnyView(SpringAnimationOptions_Exercise()), "Spring Animation Options: Exercise", "Planet Explorer"),
        ViewData(AnyView(SpringAnimationOptions_Challenge1()), "Spring Animation Options: Challenge", "Onboarding views"),
        ViewData(AnyView(Transitions_Exercise()), "Transitions: Exercise", "Travel planer"),
        ViewData(AnyView(Transitions_Challenge1()), "Transitions: Challenge 1", "Desert Life"),
        ViewData(AnyView(Transitions_Challenge2()), "Transitions: Challenge 2", "Custom Login"),
        ViewData(AnyView(CustomTimingCurve_Exercise()), "Custom Timing Curve: Exercise", "Workout Pro"),
        ViewData(AnyView(CustomTimingCurve_Challenge1()), "Custom Timing Curve: Challenge", "Popout Buttons"),
        ViewData(AnyView(MatchedGeometryEffect_Exercise()), "Matched Geometry Effect: Exercise", "Utah National Parks"),
        ViewData(AnyView(MatchedGeometryEffect_Challenge1()), "Matched Geometry Effect: Challenge", "Outdoors of Utah"),
    ]

    @State private var selectedEntry: ViewData?

    var body: some View {
        NavigationView {
            List {
                ForEach(views) { viewData in
                    NavigationLink(
                        destination: viewData.destination.navigationBarTitle(viewData.label, displayMode: .inline),
                        tag: viewData,
                        selection: $selectedEntry,
                        label: {
                            VStack(alignment: .leading) {
                                Text(viewData.label)
                                    .font(.headline)
                                Text(viewData.comment)
                                    .font(.subheadline)
                            }
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
