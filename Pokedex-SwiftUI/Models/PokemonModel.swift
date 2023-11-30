//
//  PokemonModel.swift
//  Pokedex-SwiftUI
//
//  Created by Jonas Bergström on 2023-11-30.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "charizard", url: "https://pokeapi.co/api/v2/pokemon/6/")
}
    
    struct InfoPokemon: Codable {
        let id: Int
        let weight: Int
        let height: Int
    }
