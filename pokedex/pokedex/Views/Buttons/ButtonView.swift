//
//  ButtonView.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct ButtonView: View {
    
    var action: () -> Void
    var image: String
    var helpText: String
    
    init(action: @escaping () -> Void, image: String, helpText: String) {
        
        self.action = action
        self.image = image
        self.helpText = helpText
    }
    
    var body: some View {
        
        Button(action: {
            
            self.action()
        }) {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .help(helpText)
                .frame(width: 100, height: 100)
                .padding()
        }
    }
}
