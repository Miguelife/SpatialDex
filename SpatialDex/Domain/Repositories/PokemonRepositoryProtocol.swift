//
//  PokemonRepositoryProtocol.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import SwiftUI

protocol PokemonRepositoryProtocol {
    func getPokemonList(offset: Int) async throws -> [Pokemon]
    func getDetail(for id: Int) async throws -> Pokemon
}
