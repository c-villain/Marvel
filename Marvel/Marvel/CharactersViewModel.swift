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
    
    @Published private(set) var heroes: [ModelCharacter] = []

    func fetch() async throws {
        do {
            let data = try await PublicAPI.getCharactersCollection(nameStartsWith: "Sp")
            guard let characters = data.data?.results else { return }
            heroes = characters
        } catch {
            print("error occured: \(error)")
        }
    }
}
