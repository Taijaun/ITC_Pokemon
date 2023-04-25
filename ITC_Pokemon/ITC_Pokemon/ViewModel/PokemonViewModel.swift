//
//  PokemonViewModel.swift
//  ITC_Pokemon
//
//  Created by mohomed Ali on 25/04/2023.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published var pokemonList = [PokemonDetails]()
    
    func getListOfPokemons(urlString: String){
        
    }
}
