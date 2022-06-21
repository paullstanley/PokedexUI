//
//  PokemonView.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import SwiftUI

struct PokemonView: View {
    @State var frame : CGSize = .zero
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 100
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("pkbg")
                    .resizable()
                makeView(geo)
            }
            .frame(width: geo.size.width, height: geo.size.width - geo.size.width * 0.33)
        }
    }
    
    func makeView(_ geometry: GeometryProxy)-> some View {
        DispatchQueue.main.async { self.frame = geometry.size }
        return VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonID(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                }
            } placeholder: {
                ProgressView()
            }
            
            .shadow(color: .black, radius: 3, x: 2, y: 2)
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 20, weight: .bold, design: .monospaced))
        }
        .padding()
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
