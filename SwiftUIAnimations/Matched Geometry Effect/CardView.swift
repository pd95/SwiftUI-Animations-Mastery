//
//  CardView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct CardView: View {
    let card: Card

    @Binding var selectedCard: Card.ID?
    let parentNamespace: Namespace.ID

    init(card: Card, selectedCard: Binding<Card.ID?>, parentNamespace: Namespace.ID) {
        self.card = card
        self._selectedCard = selectedCard
        self.parentNamespace = parentNamespace
    }


    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedCorner(cornerRadius: 25, corners: card.alignment == .leading ? .topRight : .topLeft)
                .fill(card.backgroundColor)
                .matchedGeometryEffect(id: "\(card.title).background", in: parentNamespace)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: card.alignment) {
                HStack(alignment: .lastTextBaseline) {
                    Text(card.title)
                        .font(.title2)
                        .fontWeight(.black)
                    Text(card.fact)
                }
                .matchedGeometryEffect(id: "\(card.title).title", in: parentNamespace)
                .padding(30)
                .transition(.opacity)
                .animation(.default)
            }
        }
        .frame(width: card.width, height: card.height, alignment: .topLeading)
        .onTapGesture {
            if selectedCard == nil {
                selectedCard = card.id
            }
            else {
                selectedCard = nil
            }
        }
        .shadow(radius: 5)
        .frame(maxWidth: .infinity, alignment: card.alignment == .leading ? .leading : .trailing)
    }
}



struct CardView_Previews: PreviewProvider {
    @Namespace static var namespace
    @State static var selectedCard: Card.ID?
    static var previews: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                ForEach(Card.allCards) { card in
                    CardView(card: card, selectedCard: $selectedCard, parentNamespace: namespace)
                }
            }
        }
    }
}
