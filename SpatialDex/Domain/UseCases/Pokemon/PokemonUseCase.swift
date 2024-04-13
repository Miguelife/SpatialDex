//
//  PokemonUseCase.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import Foundation

class PokemonUseCase: PokemonUseCaseProtocol {
    var repository: PokemonRepositoryProtocol
    
    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPokemonList(offset: Int) async throws -> [Pokemon] {
       return try await repository.getPokemonList(offset: offset)
    }
    
    func getDetail(of pokemon: Pokemon) async throws -> Pokemon {
        return try await repository.getDetail(for: pokemon.id)
    }
}

