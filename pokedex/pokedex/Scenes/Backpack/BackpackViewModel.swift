//
//  BackpackViewModel.swift
//  pokedex
//
//  Created by Silvia España on 17/5/22.
//

import Foundation
import Combine

class BackpackViewModel: ObservableObject {
    
    @Published public private(set) var pokemon: Pokemon?
    @Published public private(set) var showProgressView = false
    
    // Values
    
    var gameboyImage: String
    var pokeballImage: String
    
    private var cancellable: AnyCancellable?
    
    init() {
        
        gameboyImage = "https://media3.giphy.com/media/eh6F4t0Pm3E6eXfumz/giphy.gif?cid=790b76111b45b3c7b3039b8372b0d6afd031df04ceb9a815&rid=giphy.gif&ct=s"
        pokeballImage = "https://media0.giphy.com/media/s21vXaSxCP0pB10I7E/giphy.gif?cid=790b761107b361d755b1e601ee54cf3cfc4d9a0d94201441&rid=giphy.gif&ct=s"
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
        // Catch pokemon
    }
}
