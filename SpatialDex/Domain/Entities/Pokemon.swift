//
//  Pokemon.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import Foundation

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let pseudonym: String?
    let description: String?
    let types: [String]?
    let abilities: [String]?
    let artwork: String?
}
