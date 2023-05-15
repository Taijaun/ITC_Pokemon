//
//  PokemonViewModelTests.swift
//  ITC_PokemonTests
//
//  Created by Taijaun Pitt on 26/04/2023.
//

import XCTest
@testable import ITC_Pokemon

final class PokemonViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testApiCallWithEverythingCorrect() async throws {
        
        // Given
        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
        XCTAssertNotNil(pokemonViewModel)
        
        // When
        await pokemonViewModel.getListOfPokemons(urlString: "pokemon")
        let pokemonTestList = await pokemonViewModel.pokemonList
        
        // Then
        XCTAssertEqual(pokemonTestList.count, 15)
        
        let error = await pokemonViewModel.customisedError
        XCTAssertNil(error)
    }
    
    func testAPICallWithEmptyJson() async throws {
        
        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
        XCTAssertNotNil(pokemonViewModel)
        
        await pokemonViewModel.getListOfPokemons(urlString: "pokemon_Empty")
        let pokemonTestList = await pokemonViewModel.pokemonList
        XCTAssertEqual(pokemonTestList.count, 0)
        
        let error = await pokemonViewModel.customisedError
        XCTAssertNotNil(error)
        XCTAssertEqual(error, NetworkingError.dataNotFound)
        
    }
    
    func testAPICallWith_Invalid_Url() async throws {
        
        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
        XCTAssertNotNil(pokemonViewModel)
        
        await pokemonViewModel.getListOfPokemons(urlString: "")
        let pokemonTestList = await pokemonViewModel.pokemonList
        XCTAssertEqual(pokemonTestList.count, 0)
        
        let error = await pokemonViewModel.customisedError
        XCTAssertNotNil(error)
        XCTAssertEqual(error, NetworkingError.invalidURL)
        
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
