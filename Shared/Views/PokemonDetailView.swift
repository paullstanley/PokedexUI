//
//  PokemonDetailView.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            PokemonView(pokemon: vm.pokaman)
                    Text("**ID**: \(vm.pokemonDetails?.id ?? 1)")
                        .font(.caption2)
                    Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                        .font(.caption2)
                    Text("**Height**: \(vm.pokemonDetails?.height ?? 0) M")
                        .font(.caption2)
        }
        .scaledToFit()
        .onChange(of: vm.pokaman) { _ in
            vm.getDetails(pokemon: vm.pokaman)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
            .environmentObject(ViewModel())
    }
}
