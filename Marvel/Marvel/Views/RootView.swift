//
//  RootView.swift
//  Marvel
//
//  Created by Alexander Kraev on 11.11.2021.
//

import SwiftUI
import MarvelNetwork

struct RootView: View {
    
    let showHero: (ModelCharacter?) -> Void
    
    init(showHero: @escaping (ModelCharacter?) -> Void) {
        self.showHero = showHero
    }
    
    // Hold the state for which tab is active/selected
    @State var selection: Int = 0
    
    var body: some View {
        
        // Your native TabView here
        TabView(selection: $selection) {
            CharactersListView(showHero: showHero)
                .tag(0)
        }
        .overlay( // Overlay the custom TabView
            Color.white // Base color for Tab Bar
                .edgesIgnoringSafeArea(.vertical)
                .opacity(0.1)
                .frame(height: 50) // Match Height of native bar
                .overlay(
                    HStack {
                        // First Tab Button
                        Button {
                            self.selection = 0
                        } label: {
                            Image("marvel")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                                .opacity(selection == 0 ? 1 : 0.4)
                        }
                        .padding()
                    }
                )
            , alignment: .bottom)
        .navigationBarTitle("Marvel")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(showHero: { _ in })
    }
}
