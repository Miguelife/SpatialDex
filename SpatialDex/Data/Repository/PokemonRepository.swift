//
//  PokemonRepository.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import SwiftUI

class PokemonRepository: PokemonRepositoryProtocol {
    let datasource: PokemonDatasourceProtocol
    
    init(datasource: PokemonDatasourceProtocol) {
        self.datasource = datasource
    }
    
    func getPokemonList(offset: Int) async throws -> [Pokemon] {
        return try await datasource.getPokemonDtoList(offset: offset).map { toEntity($0) }
    }
    
    func getDetail(for id: Int) async throws -> Pokemon {
        let detail = try await datasource.getDetailDTO(for: id)
        let species = try await datasource.getSpeciesDTO(for: id)
        
        return toDetailedEntity(detail, species: species)
    }
}


fileprivate extension PokemonRepository {
    func toDto(_ entity: Pokemon) -> PokemonDTO {
        return PokemonDTO(id: entity.id,
                          name: entity.name,
                          url: "https://pokeapi.co/api/v2/pokemon/\(entity.id)/"
                          )
    }
    
    func toEntity(_ dto: PokemonDTO) -> Pokemon {
        let id = dto.url?.split(separator: "/").last ?? ""
        return Pokemon(id: Int(id) ?? -1,
                       name: dto.name ?? "",
                       pseudonym: nil,
                       description: nil,
                       types: nil,
                       abilities: nil,
                       artwork: nil
        )
    }
    
    func toDetailedEntity(_ dto: PokemonDTO, species: PokemonSpeciesDTO) -> Pokemon {
        let description = species.flavorTextEntries.first { $0.language.name == "en" }?.flavorText.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "POKéMON", with: "pokémon")
        let psudonym = species.genera.first { $0.language.name == "en" }?.genus
        let types = dto.types?.compactMap { $0.type?.name }
        let abilities = dto.abilities?.compactMap { $0.ability?.name }
        let artwork = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(dto.id ?? -1).png"
        
        return Pokemon(id: dto.id ?? -1,
                       name: dto.name ?? "",
                       pseudonym: psudonym,
                       description: description,
                       types: types,
                       abilities: abilities,
                       artwork: artwork
        )
    }
}
