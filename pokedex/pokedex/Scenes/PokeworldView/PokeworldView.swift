//
//  PokeworldView.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct PokeworldView: View {
    
    @StateObject var viewModel = PokeworldViewModel()
    
    var body: some View {

            VStack {
                
                if viewModel.pokemon == nil {
                    
                    VStack {
                        
                        Text("""
                         \"Hello there! Welcome to the world of Pokémon!
                         
                         My name is Oak! People call me the Pokémon Prof!
                         
                         This world is inhabited by creatures called Pokémon! For some people, Pokémon are pets. Others use them for fights. Myself...I study Pokémon as a profession.\"
                         """)
                            .font(.custom("Avenir", size: 16))
                            .padding(.bottom)
                        Divider()
                        Text("Click on your gameboy to find a Pokémon")
                            .font(.custom("Avenir", size: 22))
                            .padding(.top)
                        
                        Spacer()
                        
                        ButtonView(action: viewModel.getPokemon,
                                   image: viewModel.gameboyImage,
                                   helpText: "Find a Pokémon",
                                   width: 90)
                        
                        Spacer()
                    }
                    .padding()
                    
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
                                .disabled(viewModel.isCatched ? true : false)
                                .blur(radius: viewModel.isCatched ? 4 : 0)
                        }
                    }
                    Spacer()
                }
            }.onDisappear {
                viewModel.toastText = ""
                viewModel.getPokemon()
            }
            .overlay(ToastView(toastText: viewModel.toastText ?? "")
                        .offset(y: 20), alignment: .top)
    }
}


struct PokeworldView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PokeworldView()
    }
}
