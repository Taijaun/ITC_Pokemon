//
//  PokemonModel.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 25/04/2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct Pokemon: Decodable {
    let data: [PokemonDetails]
    let page, pageSize, count, totalCount: Int
}

// MARK: - Datum
struct PokemonDetails: Decodable {
    let id, name: String
    let subtypes: [String]
    let level, hp: String
    let types: [String]
    let abilities: [Ability]
    let attacks: [Attack]
    let weaknesses, resistances: [Resistance]
    let number, artist, rarity: String
    let nationalPokedexNumbers: [Int]
    let legalities: Legalities
    let images: DatumImages
    let tcgplayer: Tcgplayer
    let cardmarket: Cardmarket

//    enum CodingKeys: String, CodingKey {
//        case id, name, supertype, subtypes, level, hp, types, evolvesFrom, abilities, attacks, weaknesses, resistances, retreatCost, convertedRetreatCost
//        case datumSet = "set"
//        case number, artist, rarity, nationalPokedexNumbers, legalities, images, tcgplayer, cardmarket
//    }
}

// MARK: - Ability
struct Ability: Decodable {
    let name, text, type: String
}

// MARK: - Attack
struct Attack: Decodable {
    let name: String
    let cost: [String]
    let convertedEnergyCost: Int
    let damage, text: String
}

// MARK: - Cardmarket
struct Cardmarket: Decodable {
    let url: String
    let updatedAt: String
    let prices: [String: Double]
}

// MARK: - Set
struct Set: Decodable {
    let id, name, series: String
    let printedTotal, total: Int
    let legalities: Legalities
    let ptcgoCode, releaseDate, updatedAt: String
    let images: SetImages
}

// MARK: - SetImages
struct SetImages: Decodable {
    let symbol, logo: String
}

// MARK: - Legalities
struct Legalities: Decodable {
    let unlimited: String
}

// MARK: - DatumImages
struct DatumImages: Decodable {
    let small, large: String
}

// MARK: - Resistance
struct Resistance: Decodable {
    let type, value: String
}

// MARK: - Tcgplayer
struct Tcgplayer: Decodable {
    let url: String
    let updatedAt: String
    let prices: Prices
}

// MARK: - Prices
struct Prices: Decodable {
    let holofoil, reverseHolofoil: Holofoil
}

// MARK: - Holofoil
struct Holofoil: Decodable {
    let low, mid, high, market: Double
    let directLow: Double?
}
