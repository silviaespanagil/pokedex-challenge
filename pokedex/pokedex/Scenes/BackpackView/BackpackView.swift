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
                
                if viewModel.pokemon == nil {
                    
                    EmptyBackpackView()
                    
                    Spacer()
                    
                    ButtonView(action: viewModel.getPokemon,
                               image: viewModel.gameboyImage,
                               helpText: "Find a Pokémon",
                               width: 90)
                    
                    Spacer()
                    
                } else {
                    
                    Spacer()
                    
                    PokemonCardView(name: viewModel.pokemon!.name, weight: viewModel.pokemon!.weight, height: viewModel.pokemon!.height, image: viewModel.pokemon!.sprites.url)
                    
                    Spacer()
                    
                    HStack {
                        
                        ButtonView(action: viewModel.getPokemon,
                                   image: viewModel.gameboyImage,
                                   helpText: "Find a Pokémon",
                                   width: 90)
                        
                        if viewModel.pokemon != nil {
                            
                            ButtonView(action: viewModel.catchPokemon,
                                       image: viewModel.pokeballImage,
                                       helpText: "Catch the Pokémon")
                        }
                    }
                    Spacer()
                }}
            .toolbar {
                
                ToolbarItems(helpAction: viewModel.toggleHelp)
            }
        }.sheet(isPresented: $viewModel.showHelp) {
            HelpView()
        }
    }
}


struct BackpackView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackpackView()
    }
}
