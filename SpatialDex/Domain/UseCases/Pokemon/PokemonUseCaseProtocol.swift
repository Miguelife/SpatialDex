//
//  PokemonUseCaseProtocol.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import Foundation

protocol PokemonUseCaseProtocol {
    func getPokemonList(offset: Int) async throws -> [Pokemon]
    func getDetail(of pokemon: Pokemon) async throws -> Pokemon
}
