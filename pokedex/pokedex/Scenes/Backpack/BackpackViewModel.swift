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
    
    private var cancellable: AnyCancellable?

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
}
