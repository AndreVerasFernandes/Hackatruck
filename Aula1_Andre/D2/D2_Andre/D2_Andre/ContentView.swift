//
//  ContentView.swift
//  D2_Andre
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
        Spacer()
                 Image("caminhao")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay(Text("HackaTruck")
                            .foregroundColor(.blue)
                            .bold()
                            .offset(x: 3, y: 30)
                            .font(.title)
                                 , alignment: .top
                )
            Spacer()
            Rectangle()
                .frame(width: 280, height: 150)
                .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            ZStack{
                HStack{
                    Text("Maker")
                        .foregroundColor(.yellow)
                        .font(.title2)
                    
                    Text("Space")
                        .foregroundColor(.red)
                        .font(.title2)
                }
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
