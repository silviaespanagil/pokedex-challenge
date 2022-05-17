//
//  SearchPokemonView.swift
//  pokedex
//
//  Created by Silvia España on 5/5/22.
//

import SwiftUI

struct SearchPokemonView: View {
    
     @StateObject var viewModel = SearchPokemonViewModel()
    
    var body: some View {
        
        Button {
            viewModel.getPokemon()
        } label: {
            
        Image("")
            .renderImage(url: URL(string: "https://media3.giphy.com/media/eh6F4t0Pm3E6eXfumz/giphy.gif?cid=790b76111b45b3c7b3039b8372b0d6afd031df04ceb9a815&rid=giphy.gif&ct=s")!)
            .help("Click to find a Pokemon")
            .frame(width: 100, height: 130)
            .padding()
        }
    }
}

struct SearchPokemon_Previews: PreviewProvider {

    static var previews: some View {
        SearchPokemonView(viewModel: SearchPokemonViewModel())
    }
}
