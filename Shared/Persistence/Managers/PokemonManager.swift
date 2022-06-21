//
//  PokemonManager.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import Foundation

struct PokemonManager {
    private(set)var pokemon: [Pokemon]
    
    let data: PokemonPage = Bundle.main.decode(file: "PokemonStore.json")
    let placeHolder: Pokemon = Pokemon.samplePokemon
    
    init() {
        pokemon = data.results
    }
    
    func choose(_ pokemon: Pokemon)-> Pokemon {
        let chosenIndex = index(of: pokemon)
        return self.pokemon[chosenIndex]
    }
    
    func index(of pokemon: Pokemon)-> Int {
        for i in 0..<self.pokemon.count {
            if self.pokemon[i].id == pokemon.id - 1 {
                return i
            }
        }
        return 0
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (DetailPokemon)-> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
