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
    var width: CGFloat?
    
    init(action: @escaping () -> Void, image: String, helpText: String, width: CGFloat? = 120) {
        
        self.action = action
        self.image = image
        self.helpText = helpText
        self.width = width
    }
    
    var body: some View {
        
        Button(action: {
            
            self.action()
        }) {
            
            Image("")
                .renderImage(url: URL(string: image)!)
                .help(helpText)
                .frame(width: width, height: 120)
                .padding()
        }
    }
}
