//
//  String+CapitalizeFirstLetter.swift
//  pokedex
//
//  Created by Silvia España on 17/5/22.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
