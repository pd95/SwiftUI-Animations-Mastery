//
//  BasicAnimations_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Philipp on 26.11.20.
//

import SwiftUI

struct BasicAnimations_Challenge1: View {
    @State private var showForm = false
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack {
            TitleText("Challenge")
            SubtitleText("Show Login")
            Spacer()
            VStack {
                Text("Already have an account?")
                    .font(.title)
                    .padding()
                Button("Login Now") {
                    showForm.toggle()
                }

                VStack {
                    Image(systemName: "lock.shield")
                        .imageScale(.large)

                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                .offset(x: showForm ? 0 : -600)
                .animation(.easeInOut)
                .font(.headline)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
            Spacer()

        }
        .padding()
    }
}

struct BasicAnimations_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations_Challenge1()
    }
}
