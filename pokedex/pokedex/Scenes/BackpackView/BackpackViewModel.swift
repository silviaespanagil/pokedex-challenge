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
    
    @Published var viewState: BackpackViewState = .empty
    @Published public private(set) var pokemons: [Pokemon] = []
    
    var backpackImage: String
    
    init() {
        
        backpackImage = "Backpack"
    }
    
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    func getCatchedPokemons() {
        
        viewState = .loading
        
        pokemons = GetCatchedPokemonsUseCase().execute()
        pokemons = pokemons.sorted(by: { $0.id < $1.id })
        
        viewState = pokemons.isEmpty ? .empty : .loaded
    }
}
