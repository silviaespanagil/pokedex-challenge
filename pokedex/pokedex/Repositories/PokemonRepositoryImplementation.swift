//
//  PokemonRepositoryImplementation.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation
import Combine

class PokemonRepositoryImplementation: PokemonRepository {

    private let dataSource: PokemonDataSource
    
    init(dataSource: PokemonDataSource = PokemonDataSource()) {
        
        self.dataSource = dataSource
    }
    
    func getPokemon() -> AnyPublisher<Pokemon, Error> {
        
        return dataSource.getPokemon().map { serverPokemon -> Pokemon in
            
            let pokemon = serverPokemon.convertToEntity()
            
            return pokemon
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
}

