//
//  LoadingView.swift
//  pokedex
//
//  Created by Silvia España on 3/6/22.
//

import SwiftUI

struct LoadingView: View {
    
    @State var angle = 0.0
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Spacer()
            
            
            Image("Pokeball")
                .rotationEffect(.degrees(angle))
                .animation(.easeIn, value: angle)
            Text("Looking for a Pokémon to catch")
                .font(.custom("Avenir", size: 16))
            
            Spacer()
            
        }.onAppear {
            
            angle += 360
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
