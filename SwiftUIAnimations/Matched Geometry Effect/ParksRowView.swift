//
//  ParksRowView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct ParksRowView: View {
    var namespace: Namespace.ID
    @Binding var selectedPark: Item?
    var park: Item

    var body: some View {
        VStack {
            if park.id != selectedPark?.id {
                ZStack(alignment: .bottom) {
                    Image(park.imageName)
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: park.id, in: namespace)
                        .cornerRadius(30)

                    Text(park.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .matchedGeometryEffect(id: "\(park.id)name", in: namespace, properties: .position)
                        .zIndex(1)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground).opacity(0.4))
                }
            } else {
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .hidden()
            }
        }
        .padding(.horizontal, 12)
        .onTapGesture {
            selectedPark = park
        }
    }
}


struct ParksRowView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var park = Item(name: "Zion", imageName: "Zion", isFavorite: true    , details: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", location: "Springdale, UT")
    @State static var selectedPark: Item?

    static var previews: some View {
        ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
