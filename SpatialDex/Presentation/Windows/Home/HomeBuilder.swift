//
//  HomeBuilder.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 6/4/24.
//

import Foundation

class HomeBuilder {
    func build() -> HomePage {
        let datasource = PokemonDatasource()
        let repository = PokemonRepository(datasource: datasource)
        let useCase = PokemonUseCase(repository: repository)
        let viewModel = HomeViewModel(useCase: useCase)
        
        return HomePage(viewModel: viewModel)
    }
}

