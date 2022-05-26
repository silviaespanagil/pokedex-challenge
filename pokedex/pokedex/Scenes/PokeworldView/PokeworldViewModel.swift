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
    @Published public var isCatched : Bool = false
    @Published var toastText: String?
    
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
                    self.isPokemonCatched()
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { [self] (pokemon: Pokemon) in
                
                self.pokemon = pokemon
            })
    }
    
    func catchPokemon() {
        
        isPokemonCatched()
        
        if !isCatched {
            
        SavePokemonUseCase().execute(pokemon: pokemon!)
        toastText = "Gotcha!"
        }
    }
    
    func isPokemonCatched() {
        
        toastText = ""
        isCatched = ExistPokemonUseCase().execute(pokemon: pokemon!)
        
        if isCatched {
            
            showToast(with: "You already catched this Pokémon")
        }
    }
 
    func showToast(with text: String?) {
        
        withAnimation {
            toastText = text
        }
    }
}
