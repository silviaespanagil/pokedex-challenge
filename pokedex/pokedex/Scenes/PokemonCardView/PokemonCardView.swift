//
//  PokemonCardView.swift
//  pokedex
//
//  Created by Silvia España on 17/5/22.
//

import SwiftUI

struct PokemonCardView: View {
    
    // Parameter values
    var name: String
    var weight: String
    var height: String
    var image: String
    
    // Card values
    private let cardAndImageWidth: CGFloat = 220
    private let cardHeight: CGFloat = 270
    private let imageHeight: CGFloat = 150
    private let cornerRadius: CGFloat = 20
    
    public init(name: String, weight: String, height: String, image: String) {
        
        self.name = name
        self.weight = weight
        self.height = height
        self.image = image
    }
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading) {
                
                Image("")
                    .renderImage(url: URL(string: image)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: cardAndImageWidth, height: imageHeight)
                    .clipped()
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 3) {
                    
                    Text(name)
                        .font(.custom("Avenir", size: 25))
                        .fontWeight(.bold)
                    
                    Label(weight, systemImage: "scalemass")
                        .font(.custom("Avenir", size: 14))
                        .foregroundColor(.gray)
                    
                    Label(height, systemImage: "ruler")
                        .font(.custom("Avenir", size: 14))
                        .foregroundColor(.gray)
                }.padding([.leading, .trailing, .bottom], 20)
            }
            .background( RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .shadow(color: .gray, radius: 20, x: 2, y: 2))
            .frame(width: cardAndImageWidth, height: cardHeight)
            .cornerRadius(cornerRadius)
        }
        .multicolorGlow()
    }
    
}

extension View {
    
    func multicolorGlow() -> some View {
        
        ZStack {
            
            ForEach(0..<2) { i in
                
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors:
                                                                [Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .mask(self.blur(radius: 10))
                    .offset(x: 5, y: 5)
                    .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
            }
        }
    }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(name: "Bulbasaur", weight: "22", height: "345", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png")
    }
}
