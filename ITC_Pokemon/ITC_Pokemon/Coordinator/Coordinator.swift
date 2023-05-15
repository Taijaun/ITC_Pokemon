//
//  Coordinator.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 12/05/2023.
//
//MVVMC SWIFTUI

import Foundation
import SwiftUI

@MainActor
class Coordinator: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    var pokemon: PokemonDetails?
    
    func goToDetailScreen(pokemon: PokemonDetails){
        self.pokemon = pokemon
        navigationPath.append(MyPage.detailScreen)
    }
    func goToWebPageScreen(){
        navigationPath.append(MyPage.webPage)
    }
    func goToTestScreen(){
        navigationPath.append(MyPage.testScreen)
    }
    
    @ViewBuilder
    func getMyPage(page: MyPage) -> some View {
      
        switch page {
        case .detailScreen:
            DetailsScreen(pokemon: self.pokemon!)
        case .webPage:
            EmptyView()
        case .testScreen:
            EmptyView()
        case .mainPage:
            ContentView(pokemonViewModel: PokemonViewModel(manager: NetworkManager()))
        default:
            EmptyView()
        }
    }
    
}

enum MyPage{
    case mainPage
    case webPage
    case detailScreen
    case testScreen
}
