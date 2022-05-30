//
//  MockPokemonRepository.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
import Combine
@testable import pokedex

class MockPokemonRepository: PokemonRepository {
    
    var isGetPokemonCalled = false
    var isSavePokemonCalled = false
    var isExistPokemonCalled = false
    var isGetCatchedPokemonsCalled = false

    func getPokemon() -> AnyPublisher<Pokemon, Error> {
        
        self.isGetPokemonCalled = true
        
        var typesArray: [PokeType] = []
        
        let typeGrass = PokeType(slot: 1, name: "grass")
        let typeShadow = PokeType(slot: 2, name: "shadow")
        
        let sprite = Sprite(url: "https://www.thewandcompany.com/wp-content/uploads/2020/11/Poke-Ball-on-white-2kx2kpx-1024x1024.jpg")
        
        typesArray.append(typeGrass)
        typesArray.append(typeShadow)
        
        return Just(Pokemon(id: 3,
                            name: "Charmander",
                            sprites: sprite,
                            weight: "23",
                            height: "145",
                            experience: "50",
                            date: "July, 16th 2022",
                            types: typesArray))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        self.isSavePokemonCalled = true
    }
    
    func existPokemon(pokemon: Pokemon) -> Bool {
        
        self.isExistPokemonCalled = true
        
        return true
    }
    
    func getCatchedPokemons() -> [Pokemon] {
        
        self.isGetCatchedPokemonsCalled = true
        
        return []
    }
}
