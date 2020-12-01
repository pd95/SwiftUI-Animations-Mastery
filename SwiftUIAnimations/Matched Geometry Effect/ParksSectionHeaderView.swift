//
//  ParksSectionHeaderView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct ParksSectionHeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemBackground)
                .opacity(0.8)

            Text("UTAH  NATIONAL  PARKS")
                .font(.body)
                .fontWeight(.black)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
    }
}

struct ParksSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ParksSectionHeaderView()
    }
}
