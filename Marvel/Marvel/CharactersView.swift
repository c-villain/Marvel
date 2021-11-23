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
    @State private var selection: ModelCharacter?
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(vm.heroes) { hero in
                        CharacterView(name: hero.name,
                                      description: hero.description,
                                      imageUrl: "\(hero.thumbnail?.path ?? "").\(hero.thumbnail?._extension ?? "")")
                            .onAppear {
                                if hero.id == vm.heroes.last?.id {
                                    vm.currentOffset += vm.limit
                                }
                            }
                            .onTapGesture {
                                selection = hero
                            }
                        NavigationLink(
                            destination: CharacterView(name: selection?.name,
                                                       description: selection?.description,
                                                       imageUrl: "\(selection?.thumbnail?.path ?? "").\(selection?.thumbnail?._extension ?? "")"),
                            tag: hero,
                            selection: $selection,
                            label: {EmptyView()})
                    }
                    if vm.isLoading {
                        ProgressView()
                    }
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
