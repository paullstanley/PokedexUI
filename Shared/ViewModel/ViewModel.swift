//
//  ViewModel.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let model = PokemonManager()
    
    @Published var selectedPokemon: Pokemon = Pokemon.samplePokemon
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var pokemonList: [Pokemon] {
        model.pokemon
    }
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    func previousPokemon() {
        let reversedList = Array(pokemonList.reversed())
        let tempPokemon = selectedPokemon
        
        for i in 0..<pokemonList.count {
            if tempPokemon.id > pokemonList[0].id && tempPokemon.id <= pokemonList.last!.id && tempPokemon.id == pokemonList[i].id {
                selectedPokemon = pokemonList[i - 1]
            } else if tempPokemon.id <= pokemonList[0].id {
                selectedPokemon = reversedList[tempPokemon.id - 1]
            }
        }
    }
    
    func nextPokemon() {
        let tempPokemon = selectedPokemon
        
        for i in 0..<pokemonList.count - 1 {
            if tempPokemon.id >= pokemonList[0].id && tempPokemon.id <= pokemonList.last!.id && tempPokemon.id == pokemonList[i].id {
                selectedPokemon = pokemonList[i + 1]
            } else if tempPokemon.id >= pokemonList.last!.id - 1  {
                selectedPokemon =  pokemonList[0]
            }
        }
    }
    
    func getDetails() {
        model.getDetailedPokemon(id: selectedPokemon.id) { data in
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
