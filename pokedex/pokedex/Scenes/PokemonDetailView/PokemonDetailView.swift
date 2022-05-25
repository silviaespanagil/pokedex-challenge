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
    var types: [String]
    
    // Card values
    private let imageSize: CGFloat = 200
    private let cornerRadius: CGFloat = 20
    
    public init(name: String, weight: String, height: String, image: String, experience: String, date: String, types: [String]) {
        
        self.name = name
        self.weight = weight
        self.height = height
        self.image = image
        self.experience = experience
        self.date = date
        self.types = types
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
                
                LabelView(labelText: weight, labelImage: "scalemass")
                
                LabelView(labelText: height, labelImage: "ruler")
                
                LabelView(labelText: "\(experience) XP", labelImage: "star")
                
                LabelView(labelText: "Catched on \(date)", labelImage: "calendar")
                
                ForEach(types, id: \.self) { type in
                    
                    if type != "" {
                        
                        LabelViewWithImage(imageString: type, labelText: "Type \(type)")
                    }
                }
            }.padding([.leading, .trailing, .bottom], 20)
        }.background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.yellow)
                        .shadow(color: Color.gray ,
                                radius: 2,
                                x: 0,
                                y: 2))
            .cornerRadius(cornerRadius)
        Spacer()
    }
}


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(name: "Bulbasaur", weight: "22", height: "345", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png", experience: "34", date: "16/07/1987", types: ["grass", "water"])
    }
}
