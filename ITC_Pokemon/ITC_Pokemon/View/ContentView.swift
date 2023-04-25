//
//  ContentView.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pokemonViewModel: PokemonViewModel
    
    var body: some View {
        VStack {
            
            List(pokemonViewModel.pokemonList) { pokemon in
                HStack{
                    Text(pokemon.name ?? "")
                    Text(pokemon.hp ?? "")
                }
            }
        }
                // support concurency when view appears this block of code called to make async api call 
        .task{
                    await pokemonViewModel.getListOfPokemons(urlString: APIEndpoints.pokemonListEndpoint)
                }
                
        
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
        }
    }

