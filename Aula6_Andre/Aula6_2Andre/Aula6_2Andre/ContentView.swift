//
//  ContentView.swift
//  Aula6_2Andre
//
//  Created by Student on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ForEach(viewModel.tcgcard){ index in
                        Text(index.name!) 
                    }
                }
                .padding()
            }
        }.onAppear(){
            viewModel.fetch()
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

