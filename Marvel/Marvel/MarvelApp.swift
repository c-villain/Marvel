//
//  MarvelApp.swift
//  Marvel
//
//  Created by Alexander Kraev on 11.11.2021.
//

import SwiftUI
import MarvelNetwork

@main
struct MarvelApp: App {
    @State var stack: [Screen] = [.root]
    @StateObject public var vm = CharactersViewModel()
    
    @Injected var initalizator: Initializator
    
    init() {
        initalizator.initialize()
    }
    
    @ViewBuilder
    func view() -> some View {
        NavigationView {
            NStack($stack) { screen, _ in
                switch screen {
                case .root:
                    RootView(showHero: showHero)
                case .character(let hero):
                    CharacterView(showComic: showComic, hero: hero)
                case .comic(let url):
                    ComicView(vm: .init(comicUrl: url))
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            view()
                .environmentObject(vm)
        }
    }
    
    private func showHero(_ hero: ModelCharacter?) {
        stack.append(.character(hero))
    }
    
    private func showComic(_ url: URL) {
        stack.append(.comic(url))
    }
}
