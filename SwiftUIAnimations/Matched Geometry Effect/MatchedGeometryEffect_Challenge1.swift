//
//  MatchedGeometryEffect_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct MatchedGeometryEffect_Challenge1: View {
    @State private var search = ""
    @State private var showParks = false
    @State private var showTrails = false
    @State private var showCampsites = false
    @Namespace private var namespace

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(#colorLiteral(red: 0.1840464634, green: 0.237650163, blue: 0.09922173168, alpha: 1))
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("THE GREAT OUTDOORS OF UTAH")
                    .font(.title)
                    .fontWeight(.black)

                TextField("park, trail or campsite", text: $search)
                    .font(.headline)
                    .environment(\.colorScheme, .dark)
                    .padding()
                    .background(
                        Capsule()
                            .fill(Color(.systemBackground).opacity(0.1))
                    )
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .imageScale(.large)
                                .background(
                                    Circle()
                                        .fill(Color(#colorLiteral(red: 0.760792315, green: 0.3176632524, blue: 0.05499468744, alpha: 1)))
                                )
                        })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    )

                Image("blm")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
                Spacer()
            }
            .padding()


            Group {
                if !(showParks || showTrails || showCampsites) {
                    CardView(title: "PARKS", fact: "8 parks", backgroundColor: Color(#colorLiteral(red: 0.3371933103, green: 0.4313960373, blue: 0.3136832118, alpha: 1)), width: 300, height: 360, alignment: .leading, isSelected: $showParks, namespace: namespace)
//                        .transition(/*showParks ? .identity : */.move(edge: .bottom))
                        .animation(.spring(response: 0.7))
                        .zIndex(1)

                    CardView(title: "TRAILS", fact: "207 trails", backgroundColor: Color(#colorLiteral(red: 0.6117665172, green: 0.2980564833, blue: 0.2313555181, alpha: 1)), width: 300, height: 250, alignment:  .trailing, isSelected: $showTrails, namespace: namespace)
//                        .transition(/*showTrails ? .identity : */.move(edge: .bottom))
                        .animation(.spring(response: 0.7))
                        .zIndex(2)

                    CardView(title: "CAMPSITES", fact: "121 campsites", backgroundColor: Color(#colorLiteral(red: 0.6980050802, green: 0.5764998198, blue: 0.3293782473, alpha: 1)), width: 320, height: 100, alignment: .leading, isSelected: $showCampsites, namespace: namespace)
//                        .transition(/*showCampsites ? .identity : */.move(edge: .bottom))
                        .animation(.spring(response: 0.7))
                        .zIndex(3)
                }
                else {
                    if showParks {
                        ParksListView(parentNamespace: namespace, showView: $showParks)
                            .background(
                                Color(#colorLiteral(red: 0.3371933103, green: 0.4313960373, blue: 0.3136832118, alpha: 1))
                                    .matchedGeometryEffect(id: "PARKS.background", in: namespace)
                                    .edgesIgnoringSafeArea(.all)
                            )
                            .animation(.easeIn(duration: 0.7))
                            .zIndex(1)
                    }
                    if !showParks {
                        RoundedCorner(cornerRadius: 40, corners: .topLeft)
                            .fill(Color(#colorLiteral(red: 0.3371933103, green: 0.4313960373, blue: 0.3136832118, alpha: 1)))
                            .frame(width: 300, height: 360)
                            .matchedGeometryEffect(id: "PARKS.background", in: namespace)
                            .offset(y: 300)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(.easeIn(duration: 0.3))
                            .zIndex(1)
                    }
                    
                    if showTrails {
                        ParksListView(parentNamespace: namespace, showView: $showTrails)
                            .background(
                                Color(#colorLiteral(red: 0.6117665172, green: 0.2980564833, blue: 0.2313555181, alpha: 1))
                                    .matchedGeometryEffect(id: "TRAILS.background", in: namespace)
                                    .edgesIgnoringSafeArea(.all)
                            )
                            .animation(.easeIn(duration: 0.7))
                            .zIndex(2)
                    }
                    if !showTrails {
                        RoundedCorner(cornerRadius: 40, corners: .topLeft)
                            .fill(Color(#colorLiteral(red: 0.6117665172, green: 0.2980564833, blue: 0.2313555181, alpha: 1)))
                            .frame(width: 300, height: 250)
                            .matchedGeometryEffect(id: "TRAILS.background", in: namespace)
                            .offset(y: 300)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .animation(.easeIn(duration: 0.3))
                            .zIndex(2)
                    }

                    if showCampsites {
                        ParksListView(parentNamespace: namespace, showView: $showCampsites)
                            .background(
                                Color(#colorLiteral(red: 0.6980050802, green: 0.5764998198, blue: 0.3293782473, alpha: 1))
                                    .matchedGeometryEffect(id: "CAMPSITES.background", in: namespace)
                                    .edgesIgnoringSafeArea(.all)
                            )
                            .animation(.easeIn(duration: 0.7))
                            .zIndex(3)
                    }
                    if !showCampsites {
                        RoundedCorner(cornerRadius: 40, corners: .topRight)
                            .fill(Color(#colorLiteral(red: 0.6980050802, green: 0.5764998198, blue: 0.3293782473, alpha: 1)))
                            .frame(width: 320, height: 100)
                            .matchedGeometryEffect(id: "CAMPSITES.background", in: namespace)
                            .offset(y: 300)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .animation(.easeIn(duration: 0.3))
                            .zIndex(3)
                    }
                }
            }
            .foregroundColor(.white)
        }
        .accentColor(.gray)
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MatchedGeometryEffect_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect_Challenge1()
//            .environment(\.colorScheme, .dark)
    }
}
