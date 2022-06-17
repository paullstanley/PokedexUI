//
//  PokemonView.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 100
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 115)
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: 190, height: 115)
            }
            .background(Image("pkbg"))
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
            .shadow(color: .black, radius: 3, x: 2, y: 2)
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
