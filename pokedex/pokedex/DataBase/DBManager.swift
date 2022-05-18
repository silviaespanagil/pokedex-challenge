//
//  DBManager.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation
import CoreData

class DBManager: Persistence {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Methods
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        
        self.coreDataStack = coreDataStack
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        let dbSprite = DBSprite(context: coreDataStack.managedContext)
        dbSprite.id = UUID()
        dbSprite.url = pokemon.sprites.url
        
        let dbPokemon = DBPokemon(context: coreDataStack.managedContext)
        dbPokemon.id = Int64(pokemon.id)
        dbPokemon.name = pokemon.name
        dbPokemon.weight = pokemon.weight
        dbPokemon.height = pokemon.height
        
        dbPokemon.sprite = dbSprite

        coreDataStack.saveContext()
    }
}
