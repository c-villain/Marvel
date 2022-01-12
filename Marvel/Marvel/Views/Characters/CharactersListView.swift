//
//  CharactersListView.swift
//  Marvel
//
//  Created by Alexander Kraev on 13.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharactersListView: View {
    
    @EnvironmentObject var vm: CharactersViewModel
    
    let showHero: (ModelCharacter?) -> Void
    
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
                                showHero(hero)
                            }
                    }

                    if vm.isLoading {
                        ProgressView()
                    }
                }
            }
            .navigationBarTitle("Marvel")
        }
        .searchable(text: $vm.searchForHero)
    }
}
