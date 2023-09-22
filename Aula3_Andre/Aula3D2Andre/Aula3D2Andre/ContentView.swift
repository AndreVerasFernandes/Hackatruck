//
//  ContentView.swift
//  Aula3D2Andre
//
//  Created by Student on 04/09/23.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("André")
        Text("Test@gmail.com")
    }
}
    
    struct ContentView: View {
        @State private var showingSheet = false
        
        var body: some View {
            NavigationStack{
                VStack {
                    NavigationLink(destination: Modo1()){Text("Modo 1")}
                    NavigationLink(destination: Modo2()){Text("Modo 2")}
                    Button("Modo 3") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        SheetView()
                    }
                    
                    //NavigationLink(destination: Modo3()){Text("Modo 3")}
                }
                .padding()
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
