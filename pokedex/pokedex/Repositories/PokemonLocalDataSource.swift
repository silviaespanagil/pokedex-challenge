//
//  PokemonLocalDataSource.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation

class PokemonLocalDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        dbManager.savePokemon(pokemon: pokemon)
    }
}
