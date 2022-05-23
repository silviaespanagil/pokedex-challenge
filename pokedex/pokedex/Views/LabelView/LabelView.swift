//
//  LabelView.swift
//  pokedex
//
//  Created by Silvia España on 23/5/22.
//

import SwiftUI

struct LabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        
        Label(labelText, systemImage: labelImage)
            .font(.custom("Avenir", size: 14))
            .foregroundColor(.gray)
    }
}
