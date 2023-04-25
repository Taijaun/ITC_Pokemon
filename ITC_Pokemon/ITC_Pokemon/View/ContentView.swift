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
                Text(pokemon.name)
                Text(pokemon.hp)
                
            }.onAppear{
                pokemonViewModel.getListOfPokemons(urlString: APIEndpoints.pokemonListEndpoint)
            }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokemonViewModel: PokemonViewModel())
    }
}
