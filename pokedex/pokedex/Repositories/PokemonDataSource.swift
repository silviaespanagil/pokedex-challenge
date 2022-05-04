//
//  PokemonDataSource.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import Foundation
import Combine

class PokemonDataSource {
    
    static let getPokemon: String = "pokemon"
    
    private let baseURLString: String
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.session = session
    }
    
    func getPokemon(id: Int) -> AnyPublisher<ServerPokemonResponse, Error> {
        
        let apiManager = APIManager(baseURL: baseURLString, session: session)
        
        let urlRequest = getPokemonEndpoint(id: id)
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: Endpoints
extension PokemonDataSource {
    
    func getPokemonEndpoint(id: Int) -> URLRequest {
        
        let endpoint = "\(baseURLString)\(PokemonDataSource.getPokemon)/\(id)"
        
        let components = URLComponents(string: endpoint)
        
        let urlRequest = URLRequest(url: (components?.url!)!)
        
        return urlRequest
    }
}
