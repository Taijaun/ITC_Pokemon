//
//  PokemonViewModel.swift
//  ITC_Pokemon
//
//  Created by mohomed Ali on 25/04/2023.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var pokemonList = [PokemonDetails]()
    
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
            self.pokemonList = pokemonData.data.map { pokemonEntity in
                PokemonDetails(name: pokemonEntity.name, subtypes: pokemonEntity.subtypes, level: pokemonEntity.level, hp: pokemonEntity.hp, types: pokemonEntity.types, abilities: pokemonEntity.abilities, attacks: pokemonEntity.attacks, weaknesses: pokemonEntity.weaknesses, resistances: pokemonEntity.resistances, number: pokemonEntity.number, artist: pokemonEntity.artist, rarity: pokemonEntity.rarity, nationalPokedexNumbers: pokemonEntity.nationalPokedexNumbers, legalities: pokemonEntity.legalities, images: pokemonEntity.images, tcgplayer: pokemonEntity.tcgplayer, cardmarket: pokemonEntity.cardmarket)
            }
            // make your publishable Model match the data returned
            print(self.pokemonList)
            
        }catch let error{
            print(error.localizedDescription)
            
            
        }
        
        
        
    }
}
