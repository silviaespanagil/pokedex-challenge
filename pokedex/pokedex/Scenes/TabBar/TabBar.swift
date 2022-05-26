//
//  TabBar.swift
//  pokedex
//
//  Created by Silvia España on 18/5/22.
//

import SwiftUI

struct TabBar: View {
    
    @State var activeTab: Tab = Tab.pokeworld
    @State var showHelp = false
    
    func toggleHelp() {
        
        showHelp.toggle()
    }
    
    var body: some View {
       
        NavigationView {
            
            TabView(selection: $activeTab) {
                
                PokeworldView()
                    .tabItem {
                        
                        VStack{
                            
                            Image("Pokeworld")
                                .padding(.top, 10)
                            Text("Pokeworld")
                        }
                    }
                    .tag(Tab.pokeworld)
                
                BackpackView()
                    .tabItem {
                        
                        VStack{
                            
                            Image("Backpack")
                                .padding(.top, 10)
                            Text("Backpack")
                        }
                    }
                    .tag(Tab.backpack)
            }.toolbar {ToolbarItems(helpAction: toggleHelp, navigationTitle: activeTab.rawValue.capitalizingFirstLetter())}
        }.sheet(isPresented: $showHelp) {
            
            HelpView()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TabBar()
    }
}
