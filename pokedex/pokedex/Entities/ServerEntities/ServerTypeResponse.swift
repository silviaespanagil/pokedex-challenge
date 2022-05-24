//
//  ServerTypeResponse.swift
//  pokedex
//
//  Created by Silvia España on 23/5/22.
//

import Foundation

struct ServerTypeResponse: Codable {
    
    let name: String
    
    func converToEntity() -> TypeName {
        
        return TypeName(name: name)
    }
}
