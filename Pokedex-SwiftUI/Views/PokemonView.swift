//
//  PokemonView.swift
//  Pokedex-SwiftUI
//
//  Created by Jonas Bergström on 2023-12-05.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png" )) { image in
                switch image {
                case .empty:
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                case .failure:
                    // Handle failure (e.g., display an error message)
                    Text("Failed to load image")
                @unknown default:
                    // Handle unknown state
                    EmptyView()
                }
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design:
                        .monospaced))
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
