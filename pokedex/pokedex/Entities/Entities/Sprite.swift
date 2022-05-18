//
//  Sprite.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation

struct Sprite: Decodable {
    
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        
        case url = "front_default"
    }
}
