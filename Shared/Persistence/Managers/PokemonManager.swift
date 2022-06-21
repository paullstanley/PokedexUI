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
        let reversedList = Array(pokemon.reversed())
        var tempPokemon = currentPokemon
        
        for i in 0..<pokemon.count {
            if currentPokemon.id > pokemon[0].id && currentPokemon.id <= pokemon.last!.id - 1 && currentPokemon.id == pokemon[i].id {
                tempPokemon = pokemon[i - 1]
            } else if currentPokemon.id <= pokemon[0].id {
                tempPokemon = reversedList[currentPokemon.id]
            }
        }
        return tempPokemon
    }
    
    func getNextPokemon(_ currentPokemon: Pokemon)-> Pokemon {
        var tempPokemon = currentPokemon
        
        for i in 0..<pokemon.count {
            if currentPokemon.id >= pokemon[0].id && currentPokemon.id <= pokemon.last!.id - 1 && currentPokemon.id == pokemon[i].id {
                print(pokemon.last!.id)
                tempPokemon = pokemon[i + 1]
            } else if currentPokemon.id >= pokemon.last!.id  {
                tempPokemon =  pokemon[0]
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
