//
//  PokemonDTO.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import Foundation

struct PokemonDTO: Codable {
    let id: Int?
    let name: String?
    let url: String?
    var types: [PokemonTypeDTO]?
    var abilities: [PokemonAbilitiesDTO]?
}
