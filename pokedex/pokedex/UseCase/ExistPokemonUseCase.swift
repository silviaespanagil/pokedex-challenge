//
//  ExistPokemonUseCase.swift
//  pokedex
//
//  Created by Silvia España on 19/5/22.
//

import Foundation

class ExistPokemonUseCase {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(pokemon: Pokemon) -> Bool {
        
        repository.existPokemon(pokemon: pokemon)
    }
} 
