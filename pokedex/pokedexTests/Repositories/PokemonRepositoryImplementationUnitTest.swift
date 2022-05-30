//
//  PokemonRepositoryImplementationUnitTest.swift
//  pokedexTests
//
//  Created by Silvia España on 27/5/22.
//

import XCTest
import Combine
@testable import pokedex

class PokemonRepositoryImplementationUnitTest: XCTestCase {
    
    var sut: PokemonRepositoryImplementation!
    var local: PokemonLocalDataSource!
    
    var cancellable: AnyCancellable?
    
    let baseURLString = "http://jsonplaceholder.typicode.com/"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 5
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        
        sut = PokemonRepositoryImplementation()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        local = nil
        try super.tearDownWithError()
    }

    func testGetPokemonFailure() {
        
        // Given
        let session = getPokemonSession(statusCode: failureStatusCode)
        
        let remote = PokemonDataSource(baseURL: baseURLString, session: session)
        
        sut = PokemonRepositoryImplementation(dataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getPokemon()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                    
                case .finished:
                    break
                case .failure:
                    exp.fulfill()
                }
            }, receiveValue: { pokemon in
                
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        XCTAssertNotNil(cancellable)
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

extension PokemonRepositoryImplementationUnitTest {
    
    func getPokemonSession(statusCode: Int) -> URLSession {
        
        let url = URL(string: "http://jsonplaceholder.typicode.com/pokemon/25")
        let data = getPokemonData()
        
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getPokemonData() -> Data {
        
        let data = """
{
   "base_experience":112,
   "height":4,
   "id":25,
   "name":"pikachu",
   "sprites":{
      "front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
      },
   "types":[
      {
         "slot":1,
         "type":{
            "name":"electric",
            "url":"https://pokeapi.co/api/v2/type/13/"
         }
      }
   ],
   "weight":60
}
"""
        return Data(data.utf8)
    }
}
