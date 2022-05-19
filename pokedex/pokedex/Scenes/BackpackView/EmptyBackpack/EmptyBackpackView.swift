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
                
                Text("Looks like your backpack is empty :(")
                    .font(.title)
                
                Image("Backpack")
                    .padding()
                    .rotationEffect(.degrees(-22))
            }.padding(.bottom)
            
            Text("You better travel to the Pokeworld and catch them all!")
                .padding(.bottom)
            
            Text("\"Some trainers have no fear. To them, this is just one more challenge.\"")
                .font(.footnote)
                .foregroundColor(.gray)
            
        }.padding()
    }
}

struct EmptyBackpackView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBackpackView()
    }
}
