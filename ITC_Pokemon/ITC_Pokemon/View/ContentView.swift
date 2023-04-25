//
//  ContentView.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pokemonViewModel: PokemonViewModel
    @State var path = [Root]()
    

    var body: some View {
        
        NavigationStack(path: $path){
            
            VStack {
                
                List(pokemonViewModel.pokemonList) { pokemon in
                    NavigationLink{
                        DetailsScreen(artist: pokemon.artist ?? "", rarity: pokemon.rarity ?? "", pokemonImage: pokemon.images?.large ?? "")
                    }label: {
                        HStack{
                            ListCell(thumbnail: pokemon.images?.small ?? "https://www.kombatcards.co.uk/storage/2022/09/Pokeback-1.png")
                        }
                    }
                    
                }
            }.refreshable {
                await pokemonViewModel.getListOfPokemons(urlString: APIEndpoints.pokemonListEndpoint)
            }
            // support concurency when view appears this block of code called to make async api call
            .task{
                await pokemonViewModel.getListOfPokemons(urlString: APIEndpoints.pokemonListEndpoint)
            }
            
            
            .padding()
        }
        .navigationDestination(for: Root.self) { navigate in
            
            switch navigate {
            case .details:
                EmptyView()
            default:
                EmptyView()
            }
            
        }
    }
    
    enum Root{
        case details
    }
    
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
        }
    }

