//
//  GetPokemonUseCase.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation
import Combine

class GetPokemonUseCase {
    
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository = PokemonRepositoryImplementation()) {

        self.repository = repository
    }

    func execute() -> AnyPublisher<Pokemon, Error> {

        repository.getPokemon()
    }
}
