//
//  ModelView.swift
//  Aula7_Andre
//
//  Created by Student on 13/09/23.
//

import SwiftUI



struct carro: Codable, Identifiable{
    let id : Int?
    let marca : String
    let modelo : String
    let ano : Int
    let cor : String
    let preco : Float
    let img : String
}

class ViewModel : ObservableObject {
    @Published var Carro : [carro] = []
//    @Published var nameParking: String = "Car4Us"
//    @Published var parkingAddress : String = "Avenida Paulista 300"
//    @Published var vaga : Int = 4
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/READAndreVeras" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([carro].self, from: data)
                
                DispatchQueue.main.async {
                    self?.Carro = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

