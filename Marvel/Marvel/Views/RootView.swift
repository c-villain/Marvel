//
//  RootView.swift
//  Marvel
//
//  Created by c-villain on 11.11.2021.
//

import SwiftUI
import MarvelNetwork

struct RootView: View {
    
    init() {
        OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory()
    }
    
    var body: some View {
        TabView {
            CharactersListView()
                .environmentObject(ComicViewModel())
                .tabItem {
                    Label("Heroes", systemImage: "list.dash")
                }
            
            CreatorsView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
