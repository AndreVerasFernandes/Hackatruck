//
//  ContentView.swift
//  Aula1_Andre
//
//  Created by Student on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        Image("caminhao")
                .resizable()
                .scaledToFit()
            
            Text("HackaTruck")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            
            HStack{
                Text("Maker")
                    .font(.title2)
                    .foregroundColor(.yellow)
                    .bold()
                Text("Space")
                    .font(.title2)
                    .foregroundColor(.red)
                    .bold()
            }
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
