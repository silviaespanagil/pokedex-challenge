//
//  GetCatchedPokemonUseCaseUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 27/5/22.
//

import XCTest
@testable import pokedex

class GetCatchedPokemonUseCaseUnitTest: XCTestCase {
    
    var sut: GetCatchedPokemonsUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetCatchedPokemonIsCalled() {
        
        // Given
        let repository = MockPokemonRepository()
        sut = GetCatchedPokemonsUseCase(repository: repository)
      
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetCatchedPokemonsCalled)
    }
}
