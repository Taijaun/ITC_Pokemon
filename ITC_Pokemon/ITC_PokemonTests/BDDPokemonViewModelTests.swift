//
//  BDDPokemonViewModelTests.swift
//  ITC_PokemonTests
//
//  Created by Taijaun Pitt on 15/05/2023.
//

import Foundation
import Quick
import Nimble
@testable import ITC_Pokemon

class BDDPokemonViewModelTests: QuickSpec {
    
    override class func spec() {
        describe("Testing the PokemonViewModel business logic") {
            context("Reading local JSON file instead of Network API call") {
                
                beforeEach {
                    print("Before test")
                }
                
                afterEach {
                    print("After test")
                }
                
                // Test with everything correct
                it("Testing the getListOfPokemon Function with correct urls and expecting that we receive a list of pokemon") {
                    Task{
                        // Given
                        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
                        /*
                          View Model must conform to equatable for this to work
                          expect(pokemonViewModel).toNot(equal(nil))
                         */
                        
                        
                        
                        // When
                        await pokemonViewModel.getListOfPokemons(urlString: "pokemon")
                        let pokemonTestList = await pokemonViewModel.pokemonList
                        expect(pokemonTestList.count).to(equal(15))
                        expect(pokemonTestList.first?.name).to(equal("Ampharos"))
                        
                        // Then
                        let error = await pokemonViewModel.customisedError
                        expect(error).to(equal(nil))
                    }
                }
                
                it("Testing the getListOfPokemon function with a correct url that points to a JSON file that contains no pokemon data") {
                    Task{
                        // Given
                        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
                        
 
                        // When
                        await pokemonViewModel.getListOfPokemons(urlString: "pokemon_Empty")
                        let pokemonTestList = await pokemonViewModel.pokemonList
                        expect(pokemonTestList.count).to(equal(0))
                        expect(pokemonTestList.first?.name).to(equal(nil))
                        
                        // Then
                        let error = await pokemonViewModel.customisedError
                        expect(error).to(equal(NetworkingError.dataNotFound))
                    }
                }
                
                it("Testing the getListOfPokemon function with no url that should return no data and a network error") {
                    Task{
                        // Given
                        let pokemonViewModel = await PokemonViewModel(manager: FakeNetworkManager())
                        
 
                        // When
                        await pokemonViewModel.getListOfPokemons(urlString: "")
                        let pokemonTestList = await pokemonViewModel.pokemonList
                        expect(pokemonTestList.count).to(equal(0))
                        expect(pokemonTestList.first?.name).to(equal(nil))
                        
                        // Then
                        let error = await pokemonViewModel.customisedError
                        expect(error).to(equal(NetworkingError.invalidURL))
                    }
                }
            }
        }
    }
}
