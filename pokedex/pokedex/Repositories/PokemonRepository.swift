//
//  PokemonRepository.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation
import Combine

protocol PokemonRepository {
    
    func getPokemon() -> AnyPublisher<Pokemon, Error>
    
    func savePokemon(pokemon: Pokemon)
    func existPokemon(pokemon: Pokemon) -> Bool
    func getCatchedPokemons() -> [Pokemon]
}
