//
//  Dpad.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/18/22.
//

import SwiftUI

struct DpadView: View {
    @EnvironmentObject var vm: ViewModel
    @State var frame: CGSize = .zero
    
    var body: some View {
            GeometryReader { (geometry) in
                ZStack {
                    self.makeView(geometry)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async { self.frame = geometry.size }
        
        return ZStack {
            VStack {
                Button {
                    vm.nextPokemon()
                } label: {
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .gray, radius: 3, x: 3, y: 3)
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.top, 5)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                
                Button {
                    vm.previousPokemon()
                } label: {
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .gray, radius: 3, x: -3, y: -3)
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.top, 5)
                .rotationEffect(.degrees(180))
            }
            HStack {
                Button {
                    vm.previousPokemon()
                } label: {
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .gray, radius: 3, x: -3, y: 3)
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.top, 5)
                .rotationEffect(.degrees(270))
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    
                
                Button {
                    vm.nextPokemon()
                } label: {
                    Image(systemName: "triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .gray, radius: 3, x: 3, y: -3)
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.top, 5)
                .rotationEffect(.degrees(90))
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.width)
        .background(Color.black)
        .cornerRadius(40)
        .shadow(color: .black, radius: 3, x: 3, y: 3)
        }
}

struct Dpad_Previews: PreviewProvider {
    static var previews: some View {
        DpadView()
    }
}
