//
//  Modo2.swift
//  Aula3D2Andre
//
//  Created by Student on 04/09/23.
//

import SwiftUI

struct Modo2: View {
    @State private var username: String = ""
  
    var body: some View {
        NavigationStack{
            TextField(text: $username, prompt: Text("Required") //, onCommit: {
                      // this will be called when the search is clicked
                      //self.showSearch = true}
            ) {}
            Text("Estamos percorrendo um caminho \(username)!")
            NavigationLink(destination: FinalView(username: $username)){Text("Acessar Tela")}
        }
    }
}

struct Modo2_Previews: PreviewProvider {
    static var previews: some View {
        Modo2()
    }
}
