//
//  PokemonDataSource.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import TripleA

class PokemonDatasource: PokemonDatasourceProtocol {
    func getPokemonDtoList(offset: Int) async throws -> [PokemonDTO]   {
        let response = try await Container.network.load(endpoint: Endpoint(path: "/pokemon",
                                                                           httpMethod: .get,
                                                                           query: ["limit": "10000"]),
                                                        of: PokemonPageDTO.self)
        return response.results
    }
    
    func getDetailDTO(for id: Int) async throws -> PokemonDTO {
        let response = try await Container.network.load(endpoint: Endpoint(path: "/pokemon/\(id)/",
                                                                           httpMethod: .get),
                                                        of: PokemonDTO.self)
        return response
    }
    
    func getSpeciesDTO(for id: Int) async throws -> PokemonSpeciesDTO{
        let response = try await Container.network.load(endpoint: Endpoint(path: "/pokemon-species/\(id)/",
                                                                           httpMethod: .get),
                                                        of: PokemonSpeciesDTO.self)
        return response
    }
}
