//
//  MatchedGeometryEffect_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct MatchedGeometryEffect_Challenge1: View {
    @State private var search = ""

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


            CardView(title: "PARKS", fact: "8 parks", backgroundColor: Color(#colorLiteral(red: 0.3371933103, green: 0.4313960373, blue: 0.3136832118, alpha: 1)), width: 300, height: 400, alignment: .leading)
            CardView(title: "TRAILS", fact: "207 trails", backgroundColor: Color(#colorLiteral(red: 0.6117665172, green: 0.2980564833, blue: 0.2313555181, alpha: 1)), width: 300, height: 250, alignment: .trailing)
            CardView(title: "CAMPSITES", fact: "121 campsites", backgroundColor: Color(#colorLiteral(red: 0.6980050802, green: 0.5764998198, blue: 0.3293782473, alpha: 1)), width: 320, height: 100, alignment: .leading)
        }
        .accentColor(.gray)
        .foregroundColor(.white)
    }
}

struct MatchedGeometryEffect_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect_Challenge1()
    }
}
