//
//  BackpackView.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import SwiftUI

struct BackpackView: View {
    
    @StateObject var viewModel = BackpackViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if viewModel.pokemons.isEmpty {

                    EmptyBackpackView()
                }
                ScrollView {
                    
                    LazyVGrid(columns: viewModel.threeColumnGrid) {
                        
                        ForEach(viewModel.pokemons) { pokemon in
                            
                            NavigationLink(destination: PokemonDetailView(name: pokemon.name, weight: pokemon.weight, height: pokemon.height, image: pokemon.sprites.url, experience: pokemon.experience, date: pokemon.date)) {
                                
                            CatchedPokemonCardView(image: pokemon.sprites.url, name: pokemon.name)
                            }
                        }.buttonStyle(PlainButtonStyle())
                    }
                }.padding()
            }.toolbar {
                
                ToolbarItems(helpAction: viewModel.toggleHelp, navigationTitle: Tab.backpack.rawValue.capitalizingFirstLetter())
            }
        }.onAppear {
            
            viewModel.getCatchedPokemons()
        }
        .sheet(isPresented: $viewModel.showHelp) {
            
            HelpView()
        }
    }
}


struct BackpackView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackpackView()
    }
}
