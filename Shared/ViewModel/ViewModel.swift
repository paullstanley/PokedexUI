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
    
    @Published var selectedPokemon: Pokemon =  Pokemon.samplePokemon
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    
    var pokemonList: [Pokemon] {
        pokemonManager.pokemon
    }
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    func previousPokemon() {
        selectedPokemon = pokemonManager.getPreviousPokemon(selectedPokemon)
    }
    
    func nextPokemon() {
        selectedPokemon = pokemonManager.getNextPokemon(selectedPokemon)
    }
    
    func getPokemonID()-> Int {
        return selectedPokemon.id
    }
    
    func getDetails(pokemon: Pokemon) {
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0)
        
        pokemonManager.getDetailedPokemon(id: selectedPokemon.id) { data in
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
