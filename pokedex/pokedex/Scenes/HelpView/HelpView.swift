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
                
                Text("Catch all your favorite Pokémons and add them to your backpack.")
                    .padding([.bottom, .top], 10)
                
                Divider()
                
                HStack {
                    
                    Image("Gameboy")
                        .frame(width: 130, height: 130, alignment: .center)
                    
                    Text("Click on your Gameboy to find a new Pokémon")
                }
                
                HStack {
                    
                    Image("Pokeball")
                        .frame(width: 130, height: 130, alignment: .center)
                    
                    Text("When you find a Pokémon you like, catch it with the Pokeball")
                }
                
                Divider()
                    .padding(.bottom, 10)
                
                HStack {
                    
                    Image("Backpack")
                        .frame(width: 50, height: 50, alignment: .center)
                    Text("Go to your backpack to check all the catched Pokémons")
                }
                
                HStack {
                    
                    Image("Pokeworld")
                        .frame(width: 50, height: 50, alignment: .center)
                    Text("Go back to the world to find new Pokémons for your collection")
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
            }.font(.custom("Avenir", size: 18))
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
