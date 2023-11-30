//
//  PokemonManager.swift
//  Pokedex-SwiftUI
//
//  Created by Jonas Bergström on 2023-11-30.
//

import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getInfoPokemon(id: Int, _ completion: @escaping (InfoPokemon) -> ()) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(id)/"
        
        Bundle.main.fetchData(url: url, model: InfoPokemon.self) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
