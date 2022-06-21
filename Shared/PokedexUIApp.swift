//
//  PokedexUIApp.swift
//  Shared
//
//  Created by Paull Stanley on 6/13/22.
//

import SwiftUI

@main
struct PokedexUIApp: App {
    let vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
          #if os(macOS)
            LeftPanelView()
                .environmentObject(vm)
                .frame(minWidth: 200, maxWidth: 500, minHeight: 480, maxHeight: 1080, alignment: .center)
            #else
            LeftPanelView()
                .environmentObject(vm)
            #endif
            
        }
        
    }
}
