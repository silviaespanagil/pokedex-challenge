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
                        
                        Image("Gameboy")
                        
                        Text("Click on your Gameboy to find a new Pokémon")
                    }
                    
                    HStack {
                        
                        Image("Pokeball")

                        Text("When you find a Pokémon you like, catch it with the Pokeball")
                    }
                }
                
                Divider()
                
                Spacer()
                
                HStack {
                    
                    Image("Backpack")
                    Text("Go to your backpack to check all the catched Pokémons")
                }
                
                HStack {
                    
                    Image("Pokeworld")
                    Text("Go back to the world to find new Pokémons for your collection")
                }
                
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
