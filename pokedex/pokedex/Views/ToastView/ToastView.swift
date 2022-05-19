//
//  ToastView.swift
//  pokedex
//
//  Created by Silvia España on 19/5/22.
//

import SwiftUI

struct ToastView: View {
    
    let toastText: String
    
    var body: some View {
        
        if toastText != "" {
            
            HStack {
                
                Image("Pokeball")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading)
                Text(toastText)
                    .foregroundColor(.gray)
                    .padding()
            }.background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white))
            .shadow(color: .gray, radius: 10, x: 10, y: 10)
        } else {
            
            Spacer()
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(toastText: "You already catched this Pokémon")
    }
}
