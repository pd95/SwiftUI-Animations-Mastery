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
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section(header: ParksSectionHeaderView()) {
                    ForEach(parks) { park in
                        ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                            .animation(.easeOut)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            Group {
                if let park = selectedPark {
                    ParkDetailView(namespace: namespace, selectedPark: $selectedPark, park: park)
                        .animation(.easeOut)
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
