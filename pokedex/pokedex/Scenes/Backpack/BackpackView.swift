//
//  BackpackView.swift
//  pokedex
//
//  Created by Silvia España on 4/5/22.
//

import SwiftUI

struct BackpackView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                EmptyBackpackView()
            }
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    
                    Text("Your backpack")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }
            }
        }
    }
}
struct BackpackView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        BackpackView()
    }
}
