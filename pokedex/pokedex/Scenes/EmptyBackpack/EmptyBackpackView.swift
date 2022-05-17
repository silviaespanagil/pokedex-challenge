//
//  EmptyBackpackView.swift
//  pokedex
//
//  Created by Silvia España on 5/5/22.
//

import SwiftUI

struct EmptyBackpackView: View {

    var body: some View {
        
        VStack {

            HStack {
                
                Text("Looks like your backpack is empty :(. Search and catch a Pokémon")
                    .font(.title)
                
                Image("")
                    .renderImage(url: URL(string: "https://media0.giphy.com/media/Wj381DH2BLXF9FP3ez/giphy.gif?cid=ecf05e47cfj44zwuz3gbu501gdc9l41935rzr6h3kmcwc7va&rid=giphy.gif&ct=s")!)
                    .frame(width: 50, height: 50)
                    .padding()
                    .rotationEffect(.degrees(-22))
            }.padding(.bottom)
            Text("Click on your Gameboy to find a Pokemon")
                .padding(.bottom)
            
            Text("\"Some trainers have no fear. To them, this is just one more challenge.\"")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer()
        }
            .padding()
    }
}

struct EmptyBackpackView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBackpackView()
    }
}
