//
//  GetCatchedPokemonsUseCase.swift
//  pokedex
//
//  Created by Silvia España on 20/5/22.
//

import Foundation

class GetCatchedPokemonsUseCase {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> [Pokemon] {
        
        repository.getCatchedPokemons()
}
}
