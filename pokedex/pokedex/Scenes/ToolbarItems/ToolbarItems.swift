//
//  ToolbarItems.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct ToolbarItems: ToolbarContent {
    
    var helpAction: () -> Void
    
    init(helpAction: @escaping () -> Void) {
        
        self.helpAction = helpAction
    }
    
    var body: some ToolbarContent {
        
        ToolbarItem(placement: .principal) {
            
            Text("Pokeworld")
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
        
        ToolbarItem(placement: .navigationBarLeading) {
            
            Button {
                
                helpAction()
            } label: {
                
                Image(systemName: "questionmark.circle")
            }
        }
    }
}
