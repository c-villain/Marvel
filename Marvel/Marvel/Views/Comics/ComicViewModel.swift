//
//  ComicViewModel.swift
//  Marvel
//
//  Created by Alexander Kraev on 25.11.2021.
//

import Foundation
import MarvelNetwork

@MainActor
final class ComicViewModel: ObservableObject {
    
    @Published private(set) var comic: Comic?
    @Published private(set) var imageUrl: String?
    private let url: URL
    
    init(comicUrl: URL) {
        url = comicUrl
        print("ComicViewModel init")
    }
    
    deinit {
        print("ComicViewModel deinit")
    }
    
    func comic() async throws {
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
            guard let result = data.data?.results?.first else { return }
            comic = result
            imageUrl = "\(result.thumbnail?.path ?? "").\(result.thumbnail?._extension ?? "")"
        } catch {
            print("error occured: \(error)")
        }
    }
    
}
