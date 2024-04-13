//
//  PokemonAbilitiesDTO.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 7/4/24.
//

import Foundation

struct PokemonAbilitiesDTO: Codable {
    let ability: PokemonAbilySlot?
}

struct PokemonAbilySlot: Codable {
    let name: String
}
