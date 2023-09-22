//
//  ViewModel.swift
//  Aula6_2Andre
//
//  Created by Student on 12/09/23.
//

import SwiftUI

import SwiftUI

struct card: Codable, Identifiable {
    let id : String?
    let localId : String?
    let name : String?
    let image : String?
}
class ViewModel : ObservableObject {
    @Published var tcgcard : [card] = []
    
    func fetch(){
        guard let url = URL(string: "https://parallelum.com.br/fipe/api/v1/carros/marcas" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([card].self, from: data)
                
                DispatchQueue.main.async {
                    self?.tcgcard = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

