//
//  CharactersView.swift
//  Marvel
//
//  Created by c-villain on 13.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharactersView: View {
    
    @StateObject public var vm = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.heroes) { hero in
                    CharacterView(name: hero.name,
                                  description: hero.description,
                                  imageUrl: "\(hero.thumbnail?.path ?? "").\(hero.thumbnail?._extension ?? "")")
                }
            }
            .navigationBarTitle("Superheroes", displayMode: .automatic)
        }
        .listStyle(.plain)
        .task {
            do {
                try await vm.fetch()
            } catch {
                
            }
        }
    }
}
