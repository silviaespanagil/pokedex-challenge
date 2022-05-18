//
//  ServerSpritesResponse.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation

struct ServerSpritesResponse: Codable {
    
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        
        case url = "front_default"
    }
    
    func converToEntity() -> Sprite {
        
        return Sprite(url: url)
    }
}
