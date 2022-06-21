//
//  PokemonDetailView.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import SwiftUI

struct PokemonDetailView: View {
    @State var frame: CGSize = .zero
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        GeometryReader { geo in
            makeView(geo)
        }
        .onChange(of: vm.selectedPokemon) { _ in
            vm.getDetails(pokemon: vm.selectedPokemon)
        }
    }
    
    func makeView(_ geometry: GeometryProxy)-> some View {
        DispatchQueue.main.async { self.frame = geometry.size }
        
        return  VStack {
            PokemonView(pokemon: vm.selectedPokemon)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: geometry.size.width - 30, height: geometry.size.width - (geometry.size.width * 0.33) - 20, alignment: .center)
                .border(.black, width: 2)
                .border(
                    LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing), width: 3)
                .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
            
            Text("**ID**: \(vm.pokemonDetails?.id ?? 1)")
                .font(.caption2)
            Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                .font(.caption2)
            Text("**Height**: \(vm.pokemonDetails?.height ?? 0) M")
                .font(.caption2)
        }
        .environmentObject(vm)
        .frame(width: geometry.size.width, height: geometry.size.width)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView()
            .environmentObject(ViewModel())
    }
}
