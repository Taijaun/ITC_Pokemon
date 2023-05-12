//
//  DetailsScreen.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import SwiftUI

struct DetailsScreen: View {
    
    let pokemon: PokemonDetails
    @EnvironmentObject var coordinator: Coordinator
    
    
    var body: some View {
        
        VStack{
            //AsyncImage(url: URL(string: pokemonImage))
            Button {
                coordinator.goToTestScreen()
            } label: {
                Text("Go to EmptyScreen")
            }

            AsyncImage(url: URL(string: pokemon.images!.large! )) { Image in
                            Image.resizable().scaledToFit().padding()
                        } placeholder: {
                            ProgressView()
                        }
            Text(NSLocalizedString("artist_label", comment: "Label displaying artists name") + pokemon.artist!)
            Text(NSLocalizedString("rarity_label", comment: "Label displaying the rarity value of the card") + pokemon.rarity!)
        }
    }
    
}

//struct DetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsScreen(artist: "100", rarity: "100", pokemonImage: "").environmentObject(Coordinator())
//    }
//}
