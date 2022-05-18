//
//  HelpView.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct HelpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Catch all your favorite Pokémons and add them to your backpack.")
                
                Spacer()
                
                Divider()
                
                VStack {
                    
                    HStack {
                        
                    Image("")
                        .renderImage(url: URL(string: "https://media3.giphy.com/media/eh6F4t0Pm3E6eXfumz/giphy.gif?cid=790b76111b45b3c7b3039b8372b0d6afd031df04ceb9a815&rid=giphy.gif&ct=s")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        
                    Text("Click on your Gameboy to find a new Pokémon")
                    }
                    
                    HStack {
                        
                    Image("")
                        .renderImage(url: URL(string: "https://media0.giphy.com/media/s21vXaSxCP0pB10I7E/giphy.gif?cid=790b761107b361d755b1e601ee54cf3cfc4d9a0d94201441&rid=giphy.gif&ct=ss")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        
                    Text("When you find a Pokémon you like, catch it with the Pokeball")
                    }
                }
                
                Divider()
                
                Spacer()
                
                Text("Go to your backpack 🎒 to check all the catched Pokémons")
                Text("Go back to the world 🌍 to find new ones for your collection")
                
                Spacer()
            }
            .navigationTitle("HOW TO PLAY")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                    }
                }
            }.padding()
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HelpView()
    }
}
