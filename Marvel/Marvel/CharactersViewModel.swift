//
//  CharactersViewModel.swift
//  Marvel
//
//  Created by c-villain on 13.11.2021.
//

import SwiftUI
import MarvelNetwork

@MainActor
final class CharactersViewModel: ObservableObject {
    
    let limit: Int = 8 // heroes limit count for paging
    
    @Published private(set) var heroes: [ModelCharacter] = []
    @Published var isLoading: Bool = false
    
    init() {
        currentOffset = 0
    }
    
    var currentOffset: Int {
        didSet {
            Task {
                try await fetch()
            }
        }
    }
    
    func fetch() async throws {
        do {
            guard !isLoading else { return }
            isLoading = true
            let data = try await PublicAPI.getCharactersCollection(limit: limit, offset: currentOffset)
            guard let characters = data.data?.results else { return }
            heroes.append(contentsOf: characters)
            isLoading = false
        } catch {
            isLoading = false
            print("error occured: \(error)")
        }
    }
}
