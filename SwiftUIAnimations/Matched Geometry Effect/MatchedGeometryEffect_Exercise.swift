//
//  MatchedGeometryEffect_Exercise.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct MatchedGeometryEffect_Exercise: View {
    @Namespace var namespace
    @State private var selectedPark: Item?
    @State private var parks = Data.getUtahNationalParks()

    var body: some View {
        ScrollView {
            ParksSectionHeaderView()
                .hidden()
            LazyVStack(spacing: 12) {
                ForEach(parks) { park in
                    ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                        .animation(.easeOut)
                }
            }
        }
        .overlay(
            Group {
                if let park = selectedPark {
                    ParkDetailView(namespace: namespace, selectedPark: $selectedPark, park: park)
                        .animation(.easeOut)
                }
                else {
                    ParksSectionHeaderView()
                }
            }
        )
    }
}

struct MatchedGeometryEffect_Exercise_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect_Exercise()
    }
}
