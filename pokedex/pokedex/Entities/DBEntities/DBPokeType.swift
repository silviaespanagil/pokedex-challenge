//
//  DBPokeType.swift
//  pokedex
//
//  Created by Silvia España on 24/5/22.
//

import Foundation

extension DBPokeType {
    
    func convertToEntity() -> PokeType {
        
        return PokeType(slot: Int(slot),
                        name: name ?? "")
    }
}
