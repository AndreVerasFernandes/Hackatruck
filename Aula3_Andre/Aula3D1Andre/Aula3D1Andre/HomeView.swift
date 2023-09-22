//
//  HomeView.swift
//  Aula3D1Andre
//
//  Created by Student on 04/09/23.
//

import SwiftUI

struct HomeView: View {
    let contacts = [
            "John",
            "Alice",
            "Bob",
            "Foo",
            "Bar"
        ]
    var body: some View {
        List(contacts, id: \.self) { contact in

                    Text(contact)
                }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
