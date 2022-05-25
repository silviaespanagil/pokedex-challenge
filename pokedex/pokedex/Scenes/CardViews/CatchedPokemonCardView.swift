//
//  CatchedPokemonCardView.swift
//  pokedex
//
//  Created by Silvia España on 20/5/22.
//

import SwiftUI

struct CatchedPokemonCardView: View {
    
    var image: String
    var name: String
    
    var body: some View {
        
        VStack {
            
            Image("")
                .renderImage(url: URL(string: image)!)
            Text(name)
                .font(.custom("Avenir", size: 15))
                .padding(.bottom)
        }.background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color("PokeYellow"))
                        .shadow(color: Color.gray ,
                                radius: 2,
                                x: 0,
                                y: 2))
            .padding()
    }
}

struct CatchedPokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatchedPokemonCardView(image:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png", name: "Venusaur")
    }
}
