//
//  PokadexView.swift
//  PokedexUI
//
//  Created by Paull Stanley on 6/13/22.
//

import SwiftUI

struct PokadexView: View {
    @StateObject var vm = ViewModel()
    @State var searchText = ""
    @State private var previousButtonIsPressed = false
    @State private var nextButtonIsPressed = false
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 40))
    ]
    
    var tap: some Gesture {
           TapGesture(count: 1)
               .onEnded { _ in
                   self.previousButtonIsPressed = !self.previousButtonIsPressed
                   self.nextButtonIsPressed = !self.nextButtonIsPressed
               }
       }
    
    var body: some View {
        
        ZStack {
            VStack {
                Header()
                    .padding(.bottom, 635)
                    .scaleEffect()
                Spacer()
            }
            
            VStack {
                HeaderDivider()
                    .fill(.red)
                    .clipShape(
                        HeaderDivider()
                    )
                .shadow(color: .black, radius: 5, x: 0, y: 10)
            }
            VStack {
                InnerTopBorder()
                    .stroke(.red,
                            lineWidth: 4)
                    .shadow(color: .black, radius: 3, x: 5, y: 5)
                    .clipShape(
                        InnerTopBorder()
                    )
                .shadow(color: .black, radius: 2, x: -2, y: -2)
            }
            VStack {
                InnerBottomBorder()
                    .stroke(.red,
                            lineWidth: 4)
                    .shadow(color: .black, radius: 3, x: 5, y: 5)
                    .clipShape(
                        InnerBottomBorder()
                    )
                .shadow(color: .black, radius: 2, x: -2, y: -2)
            }
            
            HStack {
                ViewerScreen(vm: vm)
                Spacer()
                NavigationButtons()
            }
            .padding(.horizontal, 30)
            VStack {
                HStack {
                    TextField(
                        "Enter Name", text: $vm.searchText)
                    .onSubmit {
                        let tempPokemon = vm.filteredPokemon.first != nil  ?  vm.filteredPokemon[0] : vm.pokaman
                        vm.pokaman = tempPokemon
                             }
                    .background()
                    .padding(.horizontal, 50)
                    .padding(.top, 320)
                }
                
                LazyVGrid(columns: adaptiveColumns) {
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                    RoundedRectangle(cornerRadius: 5.0).frame(width: 50, height: 50)
                }
                
                .foregroundColor(.blue)
                .padding(50)
                
            }
        }
        .background(Color.red)
        .scaleEffect()
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .environmentObject(vm)
    }
}

struct InnerTopBorder: Shape {
    func path(in rect: CGRect)-> Path {
        Path { path in
            path.move(to: CGPoint(x: 10, y: rect.midY - 270))
            path.addLine(to: CGPoint(x: rect.midX + 60, y: rect.midY - 270))
            path.addLine(to: CGPoint(x: rect.midX + 100, y: rect.midY - 315))
            path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.midY - 315))
            //This is where the line turns around and createas the stroke shape
            path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.midY))
            path.addLine(to: CGPoint(x: 10, y: rect.midY))
            path.addLine(to: CGPoint(x: 10, y: rect.midY - 272))
        }
    }
}

struct InnerBottomBorder: Shape {
    func path(in rect: CGRect)-> Path {
        Path { path in
            path.move(to: CGPoint(x: 10, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.midY))
            //This is where the line turns around and createas the stroke shape
            path.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 30))
            path.addLine(to: CGPoint(x: 10, y: rect.maxY - 30))
            path.addLine(to: CGPoint(x: 10, y: rect.midY - 272))
        }
    }
}

struct HeaderDivider: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.midY - 300))
            path.addLine(to: CGPoint(x: rect.midX + 30, y: rect.midY - 300))
            path.addLine(to: CGPoint(x: rect.midX + 70, y: rect.midY - 350))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY - 350))
            //This is where the line turns around and createas the stroke shape
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY - 340))
            path.addLine(to: CGPoint(x: rect.midX + 70, y: rect.midY - 340))
            path.addLine(to: CGPoint(x: rect.midX + 30, y: rect.midY - 290))
            path.addLine(to: CGPoint(x: rect.midX - 30, y: rect.midY - 290))
            path.addLine(to: CGPoint(x: 0, y: rect.midY - 290))
        }
    }
}

struct Header: View {
    var body: some View {
        Group {
            VStack {
                HStack {
                    Circle()
                        .fill(.blue)
                        .shadow(color: Color.black.opacity(0.5), radius: 5.0, x: 1.0, y: 1.0)
                        .frame(width: 35, height: 35)
                        .padding(17)
                    
                    Circle()
                        .fill(.pink)
                        .shadow(color: Color.black.opacity(0.5), radius: 5.0, x: 1.0, y: 1.0)
                        .frame(width: 15, height: 15)
                    
                    Circle()
                        .fill(.yellow)
                        .shadow(color: Color.black.opacity(0.5), radius: 5.0, x: 1.0, y: 1.0)
                        .frame(width: 15, height: 15)
                    Circle()
                        .fill(.green)
                        .shadow(color: Color.black.opacity(0.5), radius: 5.0, x: 1.0, y: 1.0)
                        .frame(width: 15, height: 15)
                    Spacer()
                }
            }
        }
       
    }
}

struct ViewerScreen: View {
    @State var vm: ViewModel
    
    var body: some View {
        ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.white)
                    .frame(width: 200, height: 200)
                    .overlay(
                        VStack {
                            HStack {
                                Circle()
                                    .fill(.red)
                                    .frame(width: 8, height: 8)
                                    .padding(5)
                                Circle()
                                    .fill(.red)
                                    .frame(width: 8, height: 8)
                                    .padding(5)
                            }
                            Spacer()
                            HStack {
                                Circle()
                                    .fill(.red)
                                    .frame(width: 10, height: 10)
                                Spacer()
                            }
                            .padding(.bottom, 3)
                        }
                    )
                    .shadow(color: .black, radius: 4, x: 3, y: 3)
                    .padding(.bottom, 250)
         
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(.gray)
                    .frame(width: 190, height: 170)
                    .padding(.bottom, 250)
                    .overlay(
                        VStack {
                            PokemonDetailView()
                        }
                            .foregroundColor(.white)
                            .padding(.bottom, 250)
                    )
        }
    }
}

struct NavigationButtons: View {
    @EnvironmentObject var vm: ViewModel

    var body: some View {
        
        Button(action: {
            vm.previousPokemon()
        }) {
            Image(systemName: "arrowtriangle.backward.fill")
            .font(.system(size: 55))
            .foregroundColor(.blue)
            .shadow(color: .black, radius: 4, x: 3, y: 3)
            .padding(.bottom, 300)
        }
        
        Button(action: {
            vm.nextPokemon()
        }) {
        Image(systemName: "arrowtriangle.right.fill")
            .font(.system(size: 55))
            .foregroundColor(.blue)
            .shadow(color: .black, radius: 4, x: 3, y: 3)
            .padding(.bottom, 300)
            
        }
    }
}

struct PokadexView_Previews: PreviewProvider {
    static var previews: some View {
        PokadexView()
            .previewDevice("iPhone 8")
    }
}
