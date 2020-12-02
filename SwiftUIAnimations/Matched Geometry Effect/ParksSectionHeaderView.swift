//
//  ParksSectionHeaderView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct ParksSectionHeaderView: View {
    var body: some View {
        VStack {
            Text("UTAH  NATIONAL  PARKS")
                .font(.body)
                .fontWeight(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    Color(.systemBackground)
                        .opacity(0.8)
                        .edgesIgnoringSafeArea(.top)
                )

            Spacer()
        }
    }
}

struct ParksSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ParksSectionHeaderView()
    }
}
