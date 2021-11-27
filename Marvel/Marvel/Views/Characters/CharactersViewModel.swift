//
//  CharactersViewModel.swift
//  Marvel
//
//  Created by c-villain on 13.11.2021.
//

import SwiftUI
import MarvelNetwork
import Combine

@MainActor
final class CharactersViewModel: ObservableObject {
    
    let limit: Int = 8 // heroes limit count for paging
    
    @Published private(set) var heroes: [ModelCharacter] = []
    @Published var isLoading: Bool = false
    @Published var searchForHero: String = ""
    
    private var nameStartWith: String? // debounced searched text
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchForHero
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .sink(receiveValue: { t in
                self.heroes.removeAll()
                self.nameStartWith = t.isEmpty ? nil : t
                self.currentOffset = 0
            } )
            .store(in: &subscriptions)
        
        Task {
            try await charactersCollection()
        }
    }
    
    deinit {
        subscriptions.removeAll()
    }
    
    var currentOffset: Int = 0 {
        didSet {
            Task {
                try await charactersCollection(nameStartsWith: nameStartWith)
            }
        }
    }
    
    func charactersCollection(nameStartsWith: String? = nil) async throws {
        do {
            guard !isLoading else { return }
            isLoading = true
            let data = try await PublicAPI.getCharactersCollection(nameStartsWith: nameStartsWith, limit: limit, offset: currentOffset)
            guard let characters = data.data?.results else { return }
            heroes.append(contentsOf: characters)
            isLoading = false
        } catch {
            isLoading = false
            print("error occured: \(error)")
        }
    }
    
}
