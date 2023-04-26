//
//  DetailsScreen.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import SwiftUI

struct DetailsScreen: View {
    
    let artist: String
    let rarity: String
    let pokemonImage: String
    
    
    var body: some View {
        
        VStack{
            //AsyncImage(url: URL(string: pokemonImage))
            AsyncImage(url: URL(string: pokemonImage)) { Image in
                            Image.resizable().scaledToFit().padding()
                        } placeholder: {
                            ProgressView()
                        }
            Text(NSLocalizedString("artist_label", comment: "Label displaying artists name") + artist)
            Text(NSLocalizedString("rarity_label", comment: "Label displaying the rarity value of the card") + rarity)
        }
    }
    
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(artist: "100", rarity: "100", pokemonImage: "")
    }
}
