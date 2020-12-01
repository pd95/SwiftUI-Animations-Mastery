//
//  MatchedGeometryEffect_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct MatchedGeometryEffect_Challenge1: View {
    @State private var search = ""

    @Namespace private var namespace

    private let cards: [Card] = Card.allCards

    @State private var selectedCard: Card.ID? = nil

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

            ForEach(cards) { (card: Card) in
                if selectedCard == card.id {
                    CardDetailView(
                        card: card, 
                        parentNamespace: namespace,
                        showView: .init(
                            get: { selectedCard == card.id },
                            set: { self.selectedCard = $0 ? Optional(card.id) : nil })
                    )
                    .transition(.move(edge: .top))
                    .animation(.easeIn(duration: 0.5))
                }
                else {
                    CardView(card: card, selectedCard: $selectedCard, parentNamespace: namespace)
                        .offset(y: selectedCard == nil ? 0 : card.height+50)
                        .animation(.easeIn(duration: 0.3))
                }
            }
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
