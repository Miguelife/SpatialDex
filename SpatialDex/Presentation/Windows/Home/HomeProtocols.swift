//
//  HomeProtocols.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 6/4/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var pokemonList: [Pokemon] { get }
    var selectedPokemon: Pokemon? { get }
    
    func onAppear()
    func onPokemonButtonPressed(_ pokemon: Pokemon) 
}
