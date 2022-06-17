//
//  PokemonManager.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import Foundation

class PokemonManager {
    
    func getFirstPokemon()-> Pokemon {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        return pokemon[0]
    }
    
    func getPokemon()-> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        return pokemon
    }
    
    func getPreviousPokemon(pokeman: Pokemon)-> Pokemon {
        let pokemon: Pokemon = Pokemon.samplePokemon
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let results: [Pokemon] = data.results

        for i in 0..<results.count {
            if pokeman.id > 1 && pokeman.id == results[i].id {
               return results[i - 1]
            } else if pokemon.id <= 1 && pokeman.id == results[i].id {
                return results[results.count - 1]
            }
        }
        return pokeman
    }
    
    func getNextPokemon(pokemon: Pokemon)-> Pokemon {
        let pokeman: Pokemon = Pokemon.samplePokemon
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let results: [Pokemon] = data.results
        for i in 0..<results.count {
            if pokemon.id <= results.count - 1 && pokemon.id == results[i].id {
                return results[i + 1]
            } else if pokemon.id >= results.count - 1 && pokemon.id == results[i].id {
                return results.first ?? pokeman
            }
        }
            return pokeman
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (DetailPokemon)-> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
