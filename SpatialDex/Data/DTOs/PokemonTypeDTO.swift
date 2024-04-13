//
//  PokemonTypeDTO.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 7/4/24.
//

import Foundation

struct PokemonTypeDTO: Codable {
    let type: PokemonTypeSlot?
}

struct PokemonTypeSlot: Codable {
    let name: String?
}
