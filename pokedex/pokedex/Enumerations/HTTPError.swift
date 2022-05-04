//
//  HTTPError.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    
    case invalidResponse
    case invalidStatusCode
}
