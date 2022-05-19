//
//  PokeworldViewModel.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation
import SwiftUI
import Combine

class PokeworldViewModel: ObservableObject {
    
    @Published public private(set) var pokemon: Pokemon?
    @Published public private(set) var showProgressView = false
    @Published var showHelp = false
    
    // Values
    
    var gameboyImage: String
    var pokeballImage: String
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        gameboyImage = "Gameboy"
        pokeballImage = "Pokeball"
    }

    func getPokemon() {
        
        showProgressView = true
        
        cancellable = GetPokemonUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { [self] (pokemon: Pokemon) in
                
                self.pokemon = pokemon
            })
    }
    
    func catchPokemon() {
        SavePokemonUseCase().execute(pokemon: pokemon!)
    }
    
    func toggleHelp() {
        
        showHelp.toggle()
    }
}
