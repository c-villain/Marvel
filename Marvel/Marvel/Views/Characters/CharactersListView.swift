//
//  CharactersListView.swift
//  Marvel
//
//  Created by c-villain on 13.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharactersListView: View {
    
    @StateObject public var vm = CharactersViewModel()
    @State private var selection: ModelCharacter?
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(vm.heroes) { hero in
                        CharactersListView_Item(name: hero.name,
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
                        
                        NavigationLink (
                            destination: CharacterView(hero: selection),
                            tag: hero,
                            selection: $selection,
                            label: {
                                EmptyView()
                            })
                    }

                    if vm.isLoading {
                        ProgressView()
                    }
                }
            }
            .navigationBarTitle("Marvel", displayMode: .automatic)
        }
        .searchable(text: $vm.searchForHero)
    }
}
