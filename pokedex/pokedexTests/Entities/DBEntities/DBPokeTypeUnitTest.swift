//
//  DBPokeTypeUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 27/5/22.
//

import XCTest
@testable import pokedex

class DBPokeTypeUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testConvertToEntity() throws {
        
        let dbPokeTypeResponse = DBPokeType(context: TestCoreDataStack().managedContext)
        dbPokeTypeResponse.slot = 2
        dbPokeTypeResponse.name = "Charmander"
        
        let pokeType = dbPokeTypeResponse.convertToEntity()
        
        XCTAssertNotNil(pokeType)
        XCTAssertEqual(Int32(pokeType.slot), dbPokeTypeResponse.slot)
        XCTAssertEqual(pokeType.name, dbPokeTypeResponse.name)
    }
}
