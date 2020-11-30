//
//  CustomTimingCurve_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 30.11.20.
//

import SwiftUI

struct CustomTimingCurve_Challenge1: View {
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)

    private var buttons = ["car", "tram", "airplane"]

    @State private var selectedButton: String?

    var body: some View {
        ZStack(alignment: .leading) {
            backgroundGradient

            Color("Accent4")
                .frame(maxWidth: 50, maxHeight: .infinity)

            VStack(spacing: 40) {
                ForEach(buttons, id: \.self, content: buttonView)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .edgesIgnoringSafeArea(.all)
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }

    func buttonView(_ buttonImage: String) -> some View {
        let isSelected = selectedButton == buttonImage
        return Button(action: {
            selectedButton = !isSelected ? buttonImage : nil
        }, label: {
            Image(systemName: buttonImage)
                .imageScale(.large)
                .background(
                    Circle()
                        .fill(Color("Accent4"))
                        .frame(width: 100, height: 190)
                )
                .offset(x: isSelected ? 25 : 0 )
                .scaleEffect(isSelected ? 1 : 0.5)
                .animation(.timingCurve(0.09,0.76,0.6,1.2, duration: 0.4))
        })
   }
}

struct CustomTimingCurve_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        CustomTimingCurve_Challenge1()
    }
}
