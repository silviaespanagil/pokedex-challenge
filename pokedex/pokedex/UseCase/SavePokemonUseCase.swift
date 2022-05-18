//
//  SavePokemonUseCase.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation

class SavePokemonUseCase {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(pokemon: Pokemon) {
        
        repository.savePokemon(pokemon: pokemon)
    }
}
