//
//  PokemonLocalDataSourceUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 1/6/22.
//

import XCTest
@testable import pokedex

class PokemonLocalDataSourceUnitTest: XCTestCase {

    var sut: PokemonLocalDataSource!
      
      override func setUpWithError() throws {
          
          try super.setUpWithError()
          
          sut = PokemonLocalDataSource(dbManager: DBManager(coreDataStack: TestCoreDataStack()))
      }

      override func tearDownWithError() throws {
          
          sut = nil
          
          try super.tearDownWithError()
      }
    
    func testSavePokemon() {
        
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
        sut.savePokemon(pokemon: pokemon)
        let catchedPokemon = sut.getCatchedPokemons()
        
        // Then
        XCTAssertNotNil(catchedPokemon)
    }
    
    func testExistPokemon() {
        
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
        
        let secondPokemon = Pokemon(id: 23,
                                    name: "Pikachu",
                                    sprites: sprite,
                                    weight: "23",
                                    height: "145",
                                    experience: "50 XP",
                                    date: "July, 16th 2022",
                                    types: typesArray)
        
        // When
        sut.savePokemon(pokemon: pokemon)
        let existPokemon = sut.existPokemon(pokemon: pokemon)
        let exisSecondPokemon = sut.existPokemon(pokemon: secondPokemon)
        
        // Then
        XCTAssertTrue(existPokemon)
        XCTAssertFalse(exisSecondPokemon)
    }
}
