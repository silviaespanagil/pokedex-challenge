//
//  Pokemon.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation

struct Pokemon: Identifiable {
    
    let id: Int
    let name: String
    let sprites: Sprite
    let weight: String
    let height: String
    let experience: String
    let date: String
    let types: [PokeType]?
    
    private enum CodingKeys: String, CodingKey {
        
        case experience = "base_experience"
    }
}
