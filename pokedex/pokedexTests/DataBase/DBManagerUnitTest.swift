//
//  DBManagerUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
@testable import pokedex

class DBManagerUnitTest: XCTestCase {
    
    var sut: DBManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        
        sut = DBManager(coreDataStack: TestCoreDataStack())
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    func testSavePokemon() {
        
        // Given
        var sprites: Sprite
        var types: PokeType
        var pokemon: Pokemon
        
        sprites = Sprite(url: "https://s2.coinmarketcap.com/static/img/coins/200x200/8303.png")
        types = PokeType(slot: 1, name: "Shadow")
        pokemon = Pokemon(id: 2,
                          name: "Charmander",
                          sprites: sprites,
                          weight: "24",
                          height: "45",
                          experience: "23",
                          date: "July, 16th 1987",
                          types: [types])
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.getCatchedPokemons()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.count, 1)
    }
    
    func testExistPokemonIsFalse() {
        
        // Given
        var sprites: Sprite
        var types: PokeType
        var pokemon: Pokemon
        
        sprites = Sprite(url: "https://s2.coinmarketcap.com/static/img/coins/200x200/8303.png")
        types = PokeType(slot: 1, name: "Shadow")
        pokemon = Pokemon(id: 2,
                          name: "Charmander",
                          sprites: sprites,
                          weight: "24",
                          height: "45",
                          experience: "23",
                          date: "July, 16th 1987",
                          types: [types])
        
        // When
        let response = sut.existPokemon(pokemon: pokemon)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertFalse(response)
    }
    
    func testExistPokemonIsTrue() {
        
        // Given
        var sprites: Sprite
        var types: PokeType
        var pokemon: Pokemon
        
        sprites = Sprite(url: "https://s2.coinmarketcap.com/static/img/coins/200x200/8303.png")
        types = PokeType(slot: 1, name: "Shadow")
        pokemon = Pokemon(id: 2,
                          name: "Charmander",
                          sprites: sprites,
                          weight: "24",
                          height: "45",
                          experience: "23",
                          date: "July, 16th 1987",
                          types: [types])
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.existPokemon(pokemon: pokemon)
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertTrue(response)
    }
    
    func testGetCatchedPokemons() {
        
        // Given
        var sprites: Sprite
        var types: PokeType
        var pokemon: Pokemon
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let currentDate = Date()
        let date =  formatter.string(from: currentDate)
        
        sprites = Sprite(url: "https://s2.coinmarketcap.com/static/img/coins/200x200/8303.png")
        types = PokeType(slot: 1, name: "Shadow")
        pokemon = Pokemon(id: 2,
                          name: "Charmander",
                          sprites: sprites,
                          weight: "24",
                          height: "45",
                          experience: "23",
                          date: date,
                          types: [types])
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let response = sut.getCatchedPokemons()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.count, 1)
        XCTAssertEqual(response.first?.id, 2)
        XCTAssertEqual(response.first?.name, "Charmander")
        XCTAssertEqual(response.first?.sprites?.url, "https://s2.coinmarketcap.com/static/img/coins/200x200/8303.png")
        XCTAssertEqual(response.first?.weight, "24")
        XCTAssertEqual(response.first?.height, "45")
        XCTAssertEqual(response.first?.experience, "23")
        XCTAssertEqual(response.first?.date, date)
        XCTAssertEqual(response.first?.types[0].name, "Shadow")
    }
}
