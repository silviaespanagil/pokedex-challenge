//
//  SearchPokemonViewModel.swift
//  pokedex
//
//  Created by Silvia España on 5/5/22.
//

import Foundation
import Combine

class SearchPokemonViewModel: ObservableObject {
    
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
