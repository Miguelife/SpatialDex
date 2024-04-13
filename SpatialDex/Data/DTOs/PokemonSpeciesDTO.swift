//
//  PokemonSpeciesDTO.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 7/4/24.
//

import Foundation

struct PokemonSpeciesDTO: Codable {
    let flavorTextEntries: [FlavortTextEntry]
    let genera: [Genera]
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
        case genera
    }
}

struct FlavortTextEntry: Codable {
    let flavorText: String
    let language: Language
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
}

struct Genera: Codable {
    let genus: String
    let language: Language
    
    enum CodingKeys: String, CodingKey {
        case genus
        case language
    }
}

struct Language: Codable {
    let name: String
}


