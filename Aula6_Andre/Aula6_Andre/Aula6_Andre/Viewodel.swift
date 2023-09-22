//
//  viewmodel.swift
//  Aula6_Andre
//
//  Created by Student on 12/09/23.
//

import SwiftUI
struct Joke: Codable, Identifiable {
    let id: String
    let joke: String?
}
class ViewModel : ObservableObject {
    @Published var Thejoke : [Joke] = []
    
    func fetch(){
        guard let url = URL(string: "https://geek-jokes.sameerkumar.website/api?format=json" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Joke].self, from: data)
                
                DispatchQueue.main.async {
                    self?.Thejoke = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

