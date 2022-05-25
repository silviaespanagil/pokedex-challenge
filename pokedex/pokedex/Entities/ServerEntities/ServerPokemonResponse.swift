//
//  ServerPokemonResponse.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation

struct ServerPokemonResponse: Codable {
    
    let id: Int
    let name: String
    let sprites: ServerSpritesResponse
    let weight: Int
    let height: Int
    let experience: Int
    let date: String?
    let types: [ServerTypesResponse]?
    
    private enum CodingKeys: String, CodingKey {
        
        case experience = "base_experience"
        case id, name, sprites, weight, height, date, types
    }
    
    func convertToEntity() -> Pokemon {
        
        let sprites = sprites.converToEntity()
        
        var typs: [PokeType] = []
        if let serverTypes = types {
            typs = serverTypes.map({ $0.convertToEntity() })
        }
        
        return Pokemon(id: id,
                       name: name.capitalizingFirstLetter(),
                       sprites: sprites,
                       weight: String(weight),
                       height: String(height),
                       experience: String(experience),
                       date: date ?? "",
                       types: typs)
    }
}
