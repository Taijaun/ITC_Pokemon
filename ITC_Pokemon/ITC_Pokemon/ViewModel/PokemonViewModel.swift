//
//  PokemonViewModel.swift
//  ITC_Pokemon
//
//  Created by mohomed Ali on 25/04/2023.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var pokemonList = [PokemonEntity]()
    
    // initialize Nwetwork
    var manager: Networker
    
    init(manager: Networker) {
        self.manager = manager
    }
    
    func getListOfPokemons(urlString: String) async{
        // convert URL string to URL
        guard let url = URL(string: urlString) else {
            return
        }
        do {
            // initialize async await func to fetch data from Network Manager
            let data = try await self.manager.callApi(url: url)
            // decode the JSON from raw data
            let pokemonData = try JSONDecoder().decode(Pokemon.self, from: data)
            // make your publishable Model match the data returned
            self.pokemonList = pokemonData.data
            print(self.pokemonList)
            
        }catch let error{
            print(error.localizedDescription)
            
            
        }
        
        
        
    }
}
