//
//  LabelViewWithImage.swift
//  pokedex
//
//  Created by Silvia España on 25/5/22.
//

import SwiftUI

struct LabelViewWithImage: View {
    
    var imageString: String
    var labelText: String
    
    var body: some View {
        
        HStack {
            
         Image(imageString)
             .resizable()
             .frame(width: 14, height: 14)
             .foregroundColor(.gray)
         Text(labelText.capitalizingFirstLetter())
                .foregroundColor(.gray)
                .font(.custom("Avenir", size: 14))
        }
    }
}

struct LabelViewWithImage_Previews: PreviewProvider {
    static var previews: some View {
        LabelViewWithImage(imageString: "bug", labelText: "bug")
    }
}
