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
                
                ScrollView {
                    
                ForEach(viewModel.pokemons) { pokemon in
                     
                    Text(pokemon.name)
                }}
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
