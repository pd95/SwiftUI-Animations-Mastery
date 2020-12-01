//
//  CardView.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 01.12.20.
//

import SwiftUI

struct CardView: View {
    let title: String
    let fact: String
    let backgroundColor: Color
    let width: CGFloat
    let height: CGFloat
    let alignment: HorizontalAlignment

    @Binding var isSelected: Bool
    let parentNamespace: Namespace.ID

    init(title: String, fact: String, backgroundColor: Color, width: CGFloat, height: CGFloat, alignment: HorizontalAlignment, isSelected: Binding<Bool>, namespace: Namespace.ID) {
        self.title = title
        self.fact = fact
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
        self.alignment = alignment
        self._isSelected = isSelected
        self.parentNamespace = namespace
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedCorner(cornerRadius: 25, corners: alignment == .leading ? .topRight : .topLeft)
                .fill(backgroundColor)
                .matchedGeometryEffect(id: "\(title).background", in: parentNamespace)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: alignment) {
                HStack(alignment: .lastTextBaseline) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.black)
                    Text(fact)
                }
                .padding(30)
                .animation(.default)
            }
        }
        .frame(width: width, height: height, alignment: .topLeading)
        .onTapGesture {
            isSelected.toggle()
        }
        .shadow(radius: 5)
        .frame(maxWidth: .infinity, alignment: alignment == .leading ? .leading : .trailing)
    }
}



struct CardView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottom) {
                CardView(title: "PARKS", fact: "8 parks", backgroundColor: Color(#colorLiteral(red: 0.3371933103, green: 0.4313960373, blue: 0.3136832118, alpha: 1)), width: 300, height: 400, alignment: .leading, isSelected: .constant(false), namespace: namespace)
                CardView(title: "TRAILS", fact: "207 trails", backgroundColor: Color(#colorLiteral(red: 0.6117665172, green: 0.2980564833, blue: 0.2313555181, alpha: 1)), width: 300, height: 250, alignment: .trailing, isSelected: .constant(false), namespace: namespace)
                CardView(title: "CAMPSITES", fact: "121 campsites", backgroundColor: Color(#colorLiteral(red: 0.6980050802, green: 0.5764998198, blue: 0.3293782473, alpha: 1)), width: 320, height: 100, alignment: .leading, isSelected: .constant(false), namespace: namespace)
            }
        }
    }
}
