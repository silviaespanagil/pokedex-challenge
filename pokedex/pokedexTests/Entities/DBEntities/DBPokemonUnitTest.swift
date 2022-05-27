//
//  DBPokemonUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
@testable import pokedex

class DBPokemonUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() {
        
        // Given
        let id: Int = 1
        let dataBasePokemon = DBPokemon(context: TestCoreDataStack().managedContext)
        
        dataBasePokemon.id = Int64(id)
        dataBasePokemon.name = "Charmander"
        dataBasePokemon.weight = "35"
        dataBasePokemon.height = "45"
        dataBasePokemon.experience = "23"
        
        // When
        let pokemon = dataBasePokemon.convertToEntity()
        
        XCTAssertNotNil(pokemon)
        XCTAssertEqual(dataBasePokemon.id, Int64(pokemon.id))
        XCTAssertEqual(dataBasePokemon.name, pokemon.name)
        XCTAssertEqual(dataBasePokemon.weight, pokemon.weight)
        XCTAssertEqual(dataBasePokemon.height, pokemon.height)
        XCTAssertEqual(dataBasePokemon.experience, pokemon.experience)
    }
}
