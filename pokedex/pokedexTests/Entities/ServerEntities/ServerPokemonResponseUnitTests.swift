//
//  ServerPokemonResponseUnitTests.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
@testable import pokedex

class ServerPokemonResponseUnitTests: XCTestCase {
    
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
        
        let serverSpritesResponse = ServerSpritesResponse(url: "https://www.thewandcompany.com/wp-content/uploads/2020/11/Poke-Ball-on-white-2kx2kpx-1024x1024.jpg")
        let serverTypeResponse = ServerTypeResponse(name: "grass")
        let serverTypesResponse = ServerTypesResponse(slot: 3,
                                                      type: serverTypeResponse)
        let serverPokemonResponse = ServerPokemonResponse(id: 2,
                                                          name: "Charmander",
                                                          sprites: serverSpritesResponse,
                                                          weight: 24,
                                                          height: 123,
                                                          experience: 23,
                                                          date: "July, 16th 1987",
                                                          types: [serverTypesResponse])
        
        // When
        let pokemon = serverPokemonResponse.convertToEntity()
        
        // Then
        XCTAssertEqual(pokemon.id, serverPokemonResponse.id)
        XCTAssertEqual(pokemon.name, serverPokemonResponse.name)
        XCTAssertEqual(pokemon.name, serverPokemonResponse.name)
        XCTAssertEqual(pokemon.weight, String(serverPokemonResponse.weight))
        XCTAssertEqual(pokemon.height, String(serverPokemonResponse.height))
        XCTAssertEqual(pokemon.experience, String(serverPokemonResponse.experience))
        XCTAssertEqual(pokemon.date, serverPokemonResponse.date)
    }
}
