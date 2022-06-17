//
//  PokemonModel.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Codable, Equatable {
    let name: String
    let url: String
}

extension Pokemon: Identifiable {
    var id: Int {
        Int(url.components(separatedBy: "pokemon/")[1].components(separatedBy: "/")[0]) ?? 0
    }
}

extension Pokemon {
    static let samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
