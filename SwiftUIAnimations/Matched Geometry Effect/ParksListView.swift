//
//  ParksListView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct ParksListView: View {
    var parentNamespace: Namespace.ID
    @Binding var showView: Bool

    @Namespace var namespace
    @State private var showList = false
    @State private var selectedPark: Item?
    @State private var parks = Data.getUtahNationalParks()

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section(header: headerView) {
                    ForEach(parks) { park in
                        ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                            .animation(.easeOut)
                    }
                }
                .opacity(showList ? 1 : 0)
                .animation(.easeIn)
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
        .onAppear() {
            showList = false
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                withAnimation(.easeIn) {
                    showList = true
                }
            }
        }
    }

    var headerView: some View {
        ZStack(alignment: .bottom) {
            Color(.systemBackground)
                .opacity(0.8)

            Text("UTAH  NATIONAL  PARKS")
                .font(.body)
                .fontWeight(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(
                    Button(action: {
                        showList = false
                        showView = false
                    }, label: {
                        Image(systemName: "xmark")
                            .font(Font.headline)
                            .padding(10)
                            .background(
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0.760792315, green: 0.3176632524, blue: 0.05499468744, alpha: 1)))
                            )
                            .accentColor(.white)
                    })
                    .padding(.leading, 6)
                    .frame(maxWidth: .infinity, alignment: .leading)
                )
                .frame(height: 100, alignment: .bottom)
                .foregroundColor(.primary)
        }
    }
}

struct ParksListView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ParksListView(parentNamespace: namespace, showView: .constant(true))
            .environment(\.colorScheme, .dark)
    }
}
