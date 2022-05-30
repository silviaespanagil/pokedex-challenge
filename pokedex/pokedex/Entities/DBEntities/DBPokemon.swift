//
//  DBPokemon.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation
import CoreData

extension DBPokemon {
    
    func convertToEntity() -> Pokemon {
        
        let sprites = (sprite?.convertToEntity())
        
        var typs: [PokeType] = []

        if let types = types, let dbTypes = types.allObjects as? [DBPokeType] {

            typs = dbTypes.map({ $0.convertToEntity()})
        }

        return Pokemon(id: Int(id),
                       name: name ?? "",
                       sprites: sprites,
                       weight: weight ?? "",
                       height: height ?? "",
                       experience: experience ?? "",
                       date: date ?? "",
                       types: typs)
    }
}
