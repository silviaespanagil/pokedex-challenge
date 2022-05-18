//
//  ServerBaseResponse.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation

struct ServerBaseResponse<T: Codable>: Codable {

    let results: T
}
