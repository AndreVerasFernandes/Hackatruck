//
//  SwiftUIView.swift
//  Aula6_Andre
//
//  Created by Student on 12/09/23.
//

import SwiftUI

struct game: Codable, Identifiable {
    let id : Int
    let title : String?
    let short_description : String?
    let genre : String?
    let platform : String?
    let publisher : String?
    let developer : String?
    let release_date :  String?
}
class ViewModel : ObservableObject {
    @Published var pcgames : [game] = []
    
    func fetch(){
        guard let url = URL(string: "https://www.freetogame.com/api/games?platform=pc&sort-by=alphabetical" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([game].self, from: data)
                
                DispatchQueue.main.async {
                    self?.pcgames = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
