//
//  Card.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 02.12.20.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let fact: String
    let backgroundColor: Color
    let width: CGFloat
    let height: CGFloat
    let alignment: HorizontalAlignment

    static let allCards = [
        Card(title: "PARKS", fact: "8 parks", backgroundColor: Color(#colorLiteral(red: 0.3371933103, green: 0.4313960373, blue: 0.3136832118, alpha: 1)), width: 300, height: 360, alignment: .leading),
        Card(title: "TRAILS", fact: "207 trails", backgroundColor: Color(#colorLiteral(red: 0.6117665172, green: 0.2980564833, blue: 0.2313555181, alpha: 1)), width: 300, height: 250, alignment:  .trailing),
        Card(title: "CAMPSITES", fact: "121 campsites", backgroundColor: Color(#colorLiteral(red: 0.6980050802, green: 0.5764998198, blue: 0.3293782473, alpha: 1)), width: 320, height: 100, alignment: .leading)
    ]
}

