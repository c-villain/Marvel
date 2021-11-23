//
//  CharacterView.swift
//  Marvel
//
//  Created by c-villain on 24.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharacterView: View {
    
    let hero: ModelCharacter?
    var urls: [IdentifiableUrl] = []
    
    init(hero: ModelCharacter?) {
        self.hero = hero
        
        _ = hero?.urls?.compactMap {
            self.urls.append(.init(url: $0.url ?? "", type: $0.type ?? ""))
        }
    }
    
    var placeholder: some View {
        Image(systemName: "photo")
    }
    
    var body: some View {
        let imageUrl = "\(hero?.thumbnail?.path ?? "").\(hero?.thumbnail?._extension ?? "")"
        
        return ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 12.0) {
                    Text(hero?.name ?? "Unknown hero")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                    
                    Group {
                        if !imageUrl.isEmpty {
                            AsyncImage(url: .init(string: imageUrl)) { phase in
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
                        } else {
                            placeholder
                        }
                    }.overlay(alignment: .bottomLeading) {
                        HStack {
                            ForEach(self.urls) { tag in
                                if let text = tag.type, let url = URL(string: tag.url) {
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
                        .padding(8.0)
                    }
                }
                
                if let description = hero?.description, !description.isEmpty {
                    VStack(alignment: .leading, spacing: 6.0) {
                        Text("Overview:")
                            .fontWeight(.bold)
                        
                        Text(description)
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 16.0)
        }
    }
}
