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
    
    func convertToEntity() -> Pokemon {
        
        let sprites = sprites.converToEntity()
        
        return Pokemon(id: id,
                       name: name.capitalizingFirstLetter(),
                       sprites: sprites,
                       weight: String(weight),
                       height: String(height))
    }
}
