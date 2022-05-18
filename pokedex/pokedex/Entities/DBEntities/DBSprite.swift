//
//  DBSprite.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import Foundation

extension DBSprite {
    
    func convertToEntity() -> Sprite {
        
        return Sprite(url: url ?? "")
    }
}
