//
//  LeftPanelView.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/20/22.
//

import SwiftUI

struct LeftPanelView: View {
    @State var frame: CGSize = .zero
    @State var vm = ViewModel()
    
    var body: some View {
        GeometryReader { (geo) in
            Color.red.ignoresSafeArea()
            ZStack {
                VStack(alignment: .center) {
                    makeView(geo)
                    
                    TextField("Search", text: $vm.searchText)
                        .onSubmit {
                            let tempPokemon = vm.filteredPokemon.first != nil  ?  vm.filteredPokemon[0] : vm.pokaman
                            vm.pokaman = tempPokemon
                        }
                        .padding()
                        .font(.system(size: 26, weight: .bold, design: .monospaced))
                        .textCase(.uppercase)
                        .frame(width: geo.size.width - geo.size.width * 0.33, height: geo.size.height / 10)
                        .background(.black.opacity(0.85))
                        .foregroundColor(.green)
                        .border(LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing), width: 5)
                       Divider()
                    Dpad()
                        .scaledToFit()
                }
                .environmentObject(vm)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                .padding()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        
    }
    
    func makeView(_ geometry: GeometryProxy)-> some View {
        DispatchQueue.main.async { self.frame = geometry.size }
        
        return  ZStack {
            Color.white
            VStack {
                HStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 10, height: 10)
                    Circle()
                        .fill(.red)
                        .frame(width: 10, height: 10)
                }
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                .padding()
                
                Spacer()
                
                HStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 20, height: 20)
                    
                    Spacer()
                }
                .shadow(color: .black, radius: 3, x: 3, y: 3)
                .padding()
            }
            
            PokemonDetailView()
                .environmentObject(vm)
        }
        .frame(width: geometry.size.width - 30, height: geometry.size.width - 30)
        .cornerRadius(10)
        .shadow(color: .black, radius: 3, x: 3, y: 3)
        .padding()
        
    }
}



struct LeftPanelView_Previews: PreviewProvider {
    static var previews: some View {
        LeftPanelView()
    }
}
