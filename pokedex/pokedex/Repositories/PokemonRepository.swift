//
//  PokemonRepository.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation
import Combine

protocol PokemonRepository {
    
    func getPokemon(id: Int) -> AnyPublisher<Pokemon, Error>
}