//
//  ParkDetailView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct ParkDetailView: View {
    var namespace: Namespace.ID

    @Binding var selectedPark: Item!
    var park: Item!
    @State private var show = false

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            GeometryReader { proxy in
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.4)
                    .blur(radius: 30)
                    .ignoresSafeArea()
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(park.name)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .matchedGeometryEffect(id: "\(park.id)name", in: namespace, properties: .position)
                            .padding(.horizontal)

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: park.isFavorite ? "bookmark.fill" : "bookmark")
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Circle())
                        }
                        .shadow(radius: 10, y: 15)
                        .offset(x: show ? 0 : 60)
                        .animation(Animation.easeOut.delay(0.4))
                    }
                    .zIndex(2)
                    .padding(.trailing)

                    Image(park.imageName)
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: park.id, in: namespace)

                    Group {
                        HStack {
                            Text(park.location)
                                .font(.title3)
                                .italic()
                                .bold()
                                .opacity(0.5)

                            Spacer()

                            Button(action: {

                            }) {
                                Image(systemName: "map")
                                    .foregroundColor(.white)
                                    .padding(12)
                                    .background(Circle())
                            }
                            .shadow(radius: 10, y: 15)
                        }

                        Text(park.details)
                            .padding(.bottom)

                        Button(action: {
                            selectedPark = nil
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Circle())
                        }
                        .shadow(radius: 10, y: 15)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    .offset(y: show ? 0 : 20)
                    .opacity(show ? 1 : 0)
                    .animation(Animation.easeOut.delay(0.4))
                }
            }
        }
        .onAppear() {
            show.toggle()
        }
        .accentColor(Color("Gold"))
    }
}

struct ParkDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    @State static var selectedPark: Item? = Item(name: "Zion", imageName: "Zion", isFavorite: true	, details: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", location: "Springdale, UT")

    static var previews: some View {
        ParkDetailView(namespace: namespace, selectedPark: $selectedPark, park: selectedPark)
    }
}
