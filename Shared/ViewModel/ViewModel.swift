//
//  ViewModel.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokaman: Pokemon =  PokemonManager().getFirstPokemon()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var pokemonList = [Pokemon]()
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func previousPokemon() {
        pokaman = pokemonManager.getPreviousPokemon(pokeman: pokaman)
    }
    
    func nextPokemon() {
        pokaman = pokemonManager.getNextPokemon(pokemon: pokaman)
    }
    
    func getPokemonID(pokemon: Pokemon)-> Int {
        return pokemon.id
    }
    
    func getDetails(pokemon: Pokemon) {
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailedPokemon(id: pokaman.id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    func formatHW(value: Int)-> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
}
