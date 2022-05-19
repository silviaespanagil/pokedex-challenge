//
//  TabBar.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tab = Tab.pokeworld
    
    var body: some View {
        
        TabView(selection: $activeTab) {
            
            PokeworldView()
                .tabItem {
                    
                    VStack{
                        
                        Image("Pokeworld")
                        Text("Pokeworld")
                    }
                }
                .tag(Tab.pokeworld)
            
            BackpackView()
                .tabItem {
                    
                    VStack{
                        
                        Image("Backpack")
                        Text("Backpack")
                    }
                }
                .tag(Tab.backpack)
        }
        .navigationTitle(getNavBarTitle(for: activeTab))
        .navigationBarTitleDisplayMode(.large)
        
    }
    
    func getNavBarTitle(for tabItemType: Tab) -> String {
        
        switch tabItemType {
        case .pokeworld:
            return "Pokeworld"
        case .backpack:
            return "Backpack"
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
