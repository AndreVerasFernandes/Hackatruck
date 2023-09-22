//
//  ContentView.swift
//  D3
//
//  Created by Student on 31/08/23.
//

import SwiftUI
@State private var userName: String = "nome"

struct ContentView: View {
    var body: some View {
        VStack {
            TextField(
                    "User name (email address)",
                    text: $userName
                )


        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
