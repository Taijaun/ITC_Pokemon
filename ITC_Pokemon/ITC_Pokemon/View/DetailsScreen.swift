//
//  DetailsScreen.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import SwiftUI

struct DetailsScreen: View {
    
    let hp: String
    let level: String
    
    
    var body: some View {
        
        VStack{
            Text(hp)
            Text(level)
        }
    }
    
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(hp: "100", level: "100")
    }
}
