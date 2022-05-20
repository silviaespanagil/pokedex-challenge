//
//  BackpackViewModel.swift
//  pokedex
//
//  Created by Silvia España on 17/5/22.
//

import Foundation
import SwiftUI
import Combine

class BackpackViewModel: ObservableObject {
    
    @Published public private(set) var pokemons: [Pokemon] = []
    @Published var showHelp = false
    
    func getCatchedPokemons() {
        
        pokemons = GetCatchedPokemonsUseCase().execute()
    }
    
    func toggleHelp() {
        
        showHelp.toggle()
    }
}
