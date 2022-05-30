//
//  PokemonDataSourceUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 27/5/22.
//

import XCTest
@testable import pokedex

class PokemonDataSourceUnitTest: XCTestCase {

    var sut: PokemonDataSource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = PokemonDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testCharacterEndpoint() {
        
        // When
        let response = sut!.getPokemonEndpoint()
        let responseString = response.url!.absoluteString.split(separator: "?").first
        let responseDivision = responseString?.components(separatedBy: "/")
        let id = responseDivision?.last
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(responseString, "http://jsonplaceholder.typicode.com/pokemon/\(id ?? "")")
    }
}
