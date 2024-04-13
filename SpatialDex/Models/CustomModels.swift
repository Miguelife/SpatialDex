//
//  CustomModels.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 8/4/24.
//

import Foundation

enum CustomModels: String {
    case bulbasaur
    case squirtle
    case charmander
    
    static func existModel(for pokemon: Pokemon) -> Bool {
        switch pokemon.name.lowercased() {
        case CustomModels.bulbasaur.rawValue,
            CustomModels.squirtle.rawValue,
            CustomModels.charmander.rawValue:
            return true
        default:
            return false
        }
    }
}
