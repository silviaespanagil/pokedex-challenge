//
//  RenderImage.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import SwiftUI

extension Image {
    
    func renderImage(url: URL) -> Self {
        
        if let image = try? Data(contentsOf: url) {
            
            return Image(uiImage: UIImage(data: image)!)
                .resizable()
        }
        
        return self
            .resizable()
    }
}
