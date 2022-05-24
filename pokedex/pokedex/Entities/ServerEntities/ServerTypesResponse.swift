//
//  ServerTypesResponse.swift
//  pokedex
//
//  Created by Silvia España on 23/5/22.
//

import Foundation

struct ServerTypesResponse: Codable {
    
    let slot: Int
    let type: ServerTypeResponse
    
    func convertToEntity() -> PokeType {
        
        let type = type.converToEntity()
        
        return PokeType(slot: slot, type: type)
    }
}
