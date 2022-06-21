//
//  PokemonManager.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import Foundation

class PokemonManager {
    private(set)var pokemon: [Pokemon]
    
    let data: PokemonPage = Bundle.main.decode(file: "PokemonStore.json")
    let placeHolder: Pokemon = Pokemon.samplePokemon
    
    init() {
        pokemon = data.results
    }
    
    func getFirstPokemon()-> Pokemon {
        let pokemon: [Pokemon] = data.results
        return pokemon[0]
    }
    
    func getPreviousPokemon(_ currentPokemon: Pokemon)-> Pokemon {
        let results: [Pokemon] = data.results
        
        for i in 0..<results.count {
            if currentPokemon.id > 1 && currentPokemon.id == results[i].id {
                return results[i - 1]
            } else if placeHolder.id <= 1 && currentPokemon.id == results[i].id {
                return results[results.count - 1]
            }
        }
        return currentPokemon
    }
    
    func getNextPokemon(_ currentPokemon: Pokemon)-> Pokemon {
        var tempPokemon = placeHolder
        let results: [Pokemon] = data.results
        for i in 0..<results.count {
            if currentPokemon.id < results.count - 1 && currentPokemon.id == results[i].id {
                tempPokemon = results[i + 1]
            } 
        }
        return tempPokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping (DetailPokemon)-> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
