//
//  HomeView.swift
//  SpatialDex
//
//  Created by Miguel Ángel Soto González on 5/4/24.
//

import SwiftUI

struct HomePage: View {
    let viewModel: HomeViewModelProtocol
    @State var sidebarVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $sidebarVisibility) {
            VStack {
                let index = (viewModel.pokemonList.firstIndex { $0.id == viewModel.selectedPokemon?.id } ?? 0) + 1
                
                List(selection: .constant(index)) {
                    ForEach(viewModel.pokemonList) { pokemon in
                        Button(action: {
                            viewModel.onPokemonButtonPressed(pokemon)
                        }, label: {
                            HStack {
                                Text(pokemon.name.capitalized)
                                Spacer()
                                if CustomModels.existModel(for: pokemon) {
                                    Image(systemName: "view.3d")
                                }
                            }
                        })
                    }
                    
                }
            }
            .navigationTitle("SpatialDex")
            .task {
                viewModel.onAppear()
            }
        }
        
    detail: {
        let navToolbarItem = ToolbarItem(placement: .navigation) {
            Button("Show Navigation", systemImage: "sidebar.left") {
                if sidebarVisibility == NavigationSplitViewVisibility.detailOnly {
                    sidebarVisibility = NavigationSplitViewVisibility.all
                } else {
                    sidebarVisibility = NavigationSplitViewVisibility.detailOnly
                }
            }
        }
        
        if let pokemon = viewModel.selectedPokemon,
            let _ = pokemon.description {
            DetailView(pokemon: pokemon)
                .navigationTitle(pokemon.name.capitalized)
                .toolbar {
                    navToolbarItem
                }
        } else {
            ProgressView()
                .navigationTitle(viewModel.selectedPokemon?.name.capitalized ?? "")
                .toolbar {
                    navToolbarItem
                }
        }
    }
    }
}

#Preview {
    HomeBuilder().build()
}
