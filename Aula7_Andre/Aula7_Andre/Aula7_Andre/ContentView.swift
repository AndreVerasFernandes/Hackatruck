//
//  ContentView.swift
//  Aula7_Andre
//
//  Created by Student on 13/09/23.
//

import SwiftUI

struct ContentView: View {
    var nameParking: String = "Car4Us"
    var parkingAddress : String = "Avenida Paulista 300"
    var vaga : Int = 4
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{ LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack { Text("\(nameParking)")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    Text("\(parkingAddress)")
                        .font(.title2)
                    Spacer()
                    Text("Carros no local:")
                        .font(.title2)
                        .bold()
                    ScrollView(.vertical) {
                    ForEach(viewModel.Carro){ index in
                                AsyncImage(url: URL(string: "\(index.img)"))
                                { image in image.resizable() } placeholder: { Color.red } .frame(width: 200, height: 200)
                        HStack{
                            Text("\(index.marca)")
                                .font(.title3)
                            Text("\(index.modelo)")
                                .font(.title3)
                            Text(String(index.ano))
                                .font(.title3)
                        }


                        Text("Preço do carro (Tabela Fipe): \(index.preco, format: .currency(code: "BRL"))")
                        }
                    }
                    Spacer()
                }            .padding()
                
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

