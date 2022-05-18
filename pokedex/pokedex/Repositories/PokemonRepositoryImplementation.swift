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
    private let localDataSource: PokemonLocalDataSource
    
    init(dataSource: PokemonDataSource = PokemonDataSource(),
         localDataSource: PokemonLocalDataSource = PokemonLocalDataSource()) {
        
        self.dataSource = dataSource
        self.localDataSource = localDataSource
    }
    
    func getPokemon() -> AnyPublisher<Pokemon, Error> {
        
        return dataSource.getPokemon().map { serverPokemon -> Pokemon in
            
            let pokemon = serverPokemon.convertToEntity()
            
            return pokemon
        }
        .mapError({ $0 })
        .eraseToAnyPublisher()
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        return localDataSource.savePokemon(pokemon: pokemon)
    }
}

