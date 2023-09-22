//
//  ContentView.swift
//  Aula3D1Andre
//
//  Created by Student on 04/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //List()
            TabView {
                HomeView()
                    .badge(2)
                    .tabItem {
                        Label("Home", systemImage: "figure.stand.line.dotted.figure.stand")
                    }
                Searchview()
                    .tabItem {
                        Label("", systemImage: "magnifyingglass")
                    }
                PhotoView()
                    .tabItem {
                        Label("Photos", systemImage: "photo")
                    }
                MessageView()
                    .badge("!")
                    .tabItem {
                        Label("Messages", systemImage: "" )
                    }

                AccountView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
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
