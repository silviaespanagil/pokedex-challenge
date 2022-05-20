//
//  ToolbarItems.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct ToolbarItems: ToolbarContent {
    
    var helpAction: () -> Void
    var navigationTitle: String
    
    init(helpAction: @escaping () -> Void, navigationTitle: String) {
        
        self.helpAction = helpAction
        self.navigationTitle = navigationTitle
    }
    
    var body: some ToolbarContent {
        
        ToolbarItem(placement: .principal) {
            
            Text(navigationTitle)
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
