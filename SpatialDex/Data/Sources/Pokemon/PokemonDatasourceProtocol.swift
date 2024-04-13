//
//  PokemonDatasourceProtocol.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

protocol PokemonDatasourceProtocol {
    func getPokemonDtoList(offset: Int) async throws -> [PokemonDTO]
    func getSpeciesDTO(for id: Int) async throws -> PokemonSpeciesDTO
    func getDetailDTO(for id: Int) async throws -> PokemonDTO
}
