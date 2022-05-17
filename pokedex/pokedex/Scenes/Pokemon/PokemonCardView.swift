//
//  PokemonCardView.swift
//  pokedex
//
//  Created by Silvia España on 17/5/22.
//

import SwiftUI

struct PokemonCardView: View {
    
    var name: String
    var weight: String
    var height: String
    
    public init(name: String, weight: String, height: String) {
        
        self.name = name
        self.weight = weight
        self.height = height
    }
    
    var body: some View {
        
        VStack() {
            
            Spacer()
            
            Text(name)
                .foregroundColor(.black)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Text("Weight")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(weight)
                    
                    Spacer()
                }
                .padding(.bottom, 5)
                
                HStack {
                    
                    Spacer()
                    
                    Text("Height")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text(height)
                    
                    Spacer()
                }
                
                Spacer()
            }
            Spacer()
        }
        .padding()
        .frame(width: 250, height: 200)
        .background(
            ZStack {
                // TODO: CHANGE IMAGE TO API IMAGE
                Image("")
                    .renderImage(url: URL(string: "https://images.pexels.com/photos/1716861/pexels-photo-1716861.jpeg?cs=srgb&dl=pexels-carolina-castilla-arias-1716861.jpg&fm=jpg")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Color(.yellow).opacity(0.5)
            }
        )
        .cornerRadius(20)
        .contentShape(Rectangle())
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(name: "Charmander", weight: "22", height: "345")
    }
}
