//
//  CharacterView.swift
//  Marvel
//
//  Created by Alexander Kraev on 24.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharacterView: View {
    
    @EnvironmentObject var vm: ComicViewModel
    let showComic: (URL) -> Void
    
    let hero: ModelCharacter?
    @State private var selection: Comic?
    
    var placeholder: some View {
        Image(systemName: "photo")
    }
    
    var body: some View {
        let imageUrl = "\(hero?.thumbnail?.path ?? "").\(hero?.thumbnail?._extension ?? "")"
        
        return ScrollView {
            VStack(spacing: 12.0) {
                VStack(alignment: .leading, spacing: 8.0) {
                    AsyncImage(url: .init(string: imageUrl )) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure:
                            placeholder
                        @unknown default:
                            // Since the AsyncImagePhase enum isn't frozen,
                            // we need to add this currently unused fallback
                            // to handle any new cases that might be added
                            // in the future:
                            placeholder
                        }
                    }
                    .overlay(alignment: .bottomLeading) {
                        HStack {
                            if let urls = hero?.urls {
                                ForEach(urls, id: \.self) { tag in
                                    if let text = tag.type, let url = URL(string: tag.url ?? "") {
                                        Link(destination: url) {
                                            Text(text)
                                                .padding(8)
                                                .font(.body)
                                                .background(Color.blue)
                                                .foregroundColor(Color.white)
                                                .cornerRadius(5)
                                        }
                                    } else {
                                        EmptyView()
                                    }
                                }
                            }
                        }
                        .padding(8.0)
                    }
                }
                
                if let description = hero?.description, !description.isEmpty {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Overview:")
                            .fontWeight(.bold)
                        
                        Text(description)
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                }
                
                if let comicSummaryItems = hero?.comics?.items {

                    LazyVStack(alignment: .leading, spacing: 8.0) {
                        Text("Comics with \(hero?.name ?? ""):")
                            .fontWeight(.bold)
                        ForEach(comicSummaryItems, id: \.self) { comicSummary in
                            if let url = URL(string: comicSummary.resourceURI ?? "") {
                                ComicListView_Item(comicSummary: comicSummary)
                                    .padding(.vertical, 4)
                                    .onTapGesture {
                                        showComic(url)
                                    }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 16.0)
        }
        .navigationTitle(hero?.name ?? "Unknown hero")
    }
}
