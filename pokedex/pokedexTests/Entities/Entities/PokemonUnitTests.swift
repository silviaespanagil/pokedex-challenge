//
//  PokemonUnitTests.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
@testable import pokedex

class PokemonUnitTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testGetTypeIsCalled() {
        
        // Given
        var typesArray: [PokeType] = []
        
        let typeGrass = PokeType(slot: 1, name: "grass")
        let typeShadow = PokeType(slot: 2, name: "shadow")
        
        let sprite = Sprite(url: "https://www.thewandcompany.com/wp-content/uploads/2020/11/Poke-Ball-on-white-2kx2kpx-1024x1024.jpg")
        
        typesArray.append(typeGrass)
        typesArray.append(typeShadow)
        
        let pokemon = Pokemon(id: 3,
                              name: "Charmander",
                              sprites: sprite,
                              weight: "23",
                              height: "145",
                              experience: "50 XP",
                              date: "July, 16th 2022",
                              types: typesArray)
        
        // When
        let type = pokemon.getTypes()
        
        // Then
        XCTAssertNotNil(type)
        XCTAssertEqual(type, ["grass", "shadow"])
    }
}
