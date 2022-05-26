//
//  ServerSpritesResponseUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 26/5/22.
//

import XCTest
@testable import pokedex

class ServerSpritesResponseUnitTest: XCTestCase {
    
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
        
        // When
        let sprite = serverSpritesResponse.converToEntity()
        
        // Then
        XCTAssertEqual(sprite.url, serverSpritesResponse.url)
    }
}
