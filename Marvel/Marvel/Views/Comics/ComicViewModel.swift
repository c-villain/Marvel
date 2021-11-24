//
//  ComicViewModel.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import Foundation
import MarvelNetwork

@MainActor
final class ComicViewModel: ObservableObject {
    
    @Published var comics: [Comic] = []
    
    func comicWith(_ url: URL) async throws {
        do {
            guard let id = Int(url.lastPathComponent) else { return }
            try await self.comicWith(id)
        } catch {
            print("error occured: \(error)")
        }
    }
    
    private func comicWith(_ id: Int) async throws {
        do {
            let data = try await PublicAPI.getComicIndividual(comicId: id)
            guard let results = data.data?.results else { return }
            comics.append(contentsOf: results)
        } catch {
            print("error occured: \(error)")
        }
    }
    
}
