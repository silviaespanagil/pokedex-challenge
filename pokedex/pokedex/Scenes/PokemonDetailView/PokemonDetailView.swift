//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Silvia España on 23/5/22.
//

import SwiftUI

struct PokemonDetailView: View {
    
    // Parameter values
    var name: String
    var weight: String
    var height: String
    var image: String
    var experience: String
    var date: String
    
    // Card values
    private let imageSize: CGFloat = 200
    private let cornerRadius: CGFloat = 20
    
    public init(name: String, weight: String, height: String, image: String, experience: String, date: String) {
        
        self.name = name
        self.weight = weight
        self.height = height
        self.image = image
        self.experience = experience
        self.date = date
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize)
                .clipped()
            
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
                
                Label("\(experience) XP", systemImage: "star")
                    .font(.custom("Avenir", size: 14))
                    .foregroundColor(.gray)
                
                Label("Saved on: \(date)", systemImage: "calendar")
                    .font(.custom("Avenir", size: 14))
                    .foregroundColor(.gray)
                
            }.padding([.leading, .trailing, .bottom], 20)
        }.background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.yellow)
                        .shadow(color: Color.gray ,
                                radius: 2,
                                x: 0,
                                y: 2))
//        .frame(width: imageSize)
        .cornerRadius(cornerRadius)
        Spacer()
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(name: "Bulbasaur", weight: "22", height: "345", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png", experience: "34", date: "16/07/1987")
    }
}
