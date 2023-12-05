//
//  InfoPokemonView.swift
//  Pokedex-SwiftUI
//
//  Created by Jonas Bergström on 2023-12-05.
//

import SwiftUI

struct InfoPokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("**ID**: \(vm.infoPokemon?.id ?? 0)")
                Text("**Height**: \(vm.formatHW(value: vm.infoPokemon?.height ?? 0)) KG")
                Text("**Weight**: \(vm.formatHW(value: vm.infoPokemon?.weight ?? 0)) M")
            }
        }
        .onAppear {
            vm.getInfo(pokemon: pokemon)
        }
    }
}

#Preview {
    InfoPokemonView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
