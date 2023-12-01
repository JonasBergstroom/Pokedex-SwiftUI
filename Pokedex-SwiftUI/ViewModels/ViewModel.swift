//
//  ViewModel.swift
//  Pokedex-SwiftUI
//
//  Created by Jonas Bergström on 2023-11-30.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var infoPokemon: InfoPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getInfo(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.infoPokemon = InfoPokemon(id: 0, weight: 0, height: 0)
        
        pokemonManager.getInfoPokemon(id: id) { data in
            
            DispatchQueue.main.async {
                self.infoPokemon = data
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let doubleValue = Double(value)
        let string = String(format: "%.2f", doubleValue / 10)
        
        return string
    }
}
