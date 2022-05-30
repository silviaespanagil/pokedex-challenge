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
        // TODO: Move formatter to extension
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        let currentDate = Date()
        let date =  formatter.string(from: currentDate)
        
        let dbSprite = DBSprite(context: coreDataStack.managedContext)
        dbSprite.id = UUID()
        dbSprite.url = pokemon.sprites?.url
        
        let dbPokemon = DBPokemon(context: coreDataStack.managedContext)
        dbPokemon.id = Int64(pokemon.id)
        dbPokemon.name = pokemon.name
        dbPokemon.weight = pokemon.weight
        dbPokemon.height = pokemon.height
        dbPokemon.experience = pokemon.experience
        dbPokemon.date = date
        
        dbPokemon.sprite = dbSprite
        
        for type in pokemon.types {
            
            let dbPokeType = DBPokeType(context: coreDataStack.managedContext)
            dbPokeType.id = UUID()
            dbPokeType.slot = Int32(type.slot)
            dbPokeType.name = type.name
            dbPokeType.pokemon = dbPokemon
        }
        
        coreDataStack.saveContext()
    }
    
    func existPokemon(pokemon: Pokemon) -> Bool {
        
        let pokemonId = Int64(pokemon.id)
        
        let fetchRequest = NSFetchRequest<DBPokemon>(entityName: "DBPokemon")
        fetchRequest.predicate = NSPredicate(format: "id==\(pokemonId)")
        
        do {
            
            let dbPokemon = try coreDataStack.managedContext.fetch(fetchRequest)
            
            return dbPokemon.first != nil
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
            
            return false
        }
    }
    
    func getCatchedPokemons() -> [Pokemon] {
        
        var pokemons: [Pokemon] = []
        
        let fetchRequest = NSFetchRequest<DBPokemon>(entityName: "DBPokemon")
        
        do {
            
            let dbPokemons = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbPokemon in dbPokemons {
                
                let pokemon = dbPokemon.convertToEntity()
                pokemons.append(pokemon)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return pokemons
    }
}
