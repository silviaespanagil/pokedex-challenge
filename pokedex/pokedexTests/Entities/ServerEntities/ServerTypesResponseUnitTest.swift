//
//  ServerTypesResponseUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
@testable import pokedex

class ServerTypesResponseUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        try super.tearDownWithError()
    }
    
    func testPowerConvertToEntity() {
        
        // Given
        let serverTypeResponse = ServerTypeResponse(name: "grass")
        let serverTypesResponse = ServerTypesResponse(slot: 3,
                                                      type: serverTypeResponse)
        
        // When
        let types = serverTypesResponse.convertToEntity()
        
        // Then
        XCTAssertEqual(types.slot, serverTypesResponse.slot)
        XCTAssertEqual(types.name, serverTypeResponse.name)
    }
}
