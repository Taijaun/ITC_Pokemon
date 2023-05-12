//
//  ITC_PokemonApp.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import SwiftUI

@main
struct ITC_PokemonApp: App {
    var body: some Scene {
        WindowGroup {
            EntryPoint().environmentObject(Coordinator())
        }
    }
}
