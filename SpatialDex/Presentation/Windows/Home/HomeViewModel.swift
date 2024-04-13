//
//  HomeViewMode.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 6/4/24.
//

import SwiftUI

@Observable
class HomeViewModel: HomeViewModelProtocol {
    let useCase: PokemonUseCaseProtocol
    var pokemonList: [Pokemon] = []
    var selectedPokemon: Pokemon?
    
    // MARK: - Init
    init(useCase: PokemonUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - LIFE CYCLE
    func onAppear() {
        if selectedPokemon != nil { return }
        
        Task {
            do {
                pokemonList = try await useCase.getPokemonList(offset: 0)
                selectedPokemon = pokemonList.first
                selectedPokemon = try await useCase.getDetail(of: selectedPokemon!)
            } catch {
                pokemonList = []
            }
        }
    }
    
    // MARK: - Functions
    func onPokemonButtonPressed(_ pokemon: Pokemon) {
        selectedPokemon = pokemon
        
        Task {
            do {
                selectedPokemon = try await useCase.getDetail(of: selectedPokemon!)
            }
        }
    }
}

