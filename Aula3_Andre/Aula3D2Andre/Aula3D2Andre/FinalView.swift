//
//  FinalView.swift
//  Aula3D2Andre
//
//  Created by Student on 04/09/23.
//

import SwiftUI

struct FinalView: View {
    @Binding var username: String
    
    var body: some View {
        Text("Volte \(username)!")
    }
}

struct FinalView_Previews: PreviewProvider {
    @State static var username: String = ""

    static var previews: some View {
        FinalView(username: $username)
    }
}
