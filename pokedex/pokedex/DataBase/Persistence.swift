//
//  Persistence.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation

protocol Persistence {
    
    // Save Pokémon in DB
    func savePokemon(pokemon: Pokemon)
    
    // Check if Pokémon is already catched
    func existPokemon(pokemon: Pokemon) -> Bool
   
    // Get catched Pokémons
    func getCatchedPokemons() -> [Pokemon]
}
