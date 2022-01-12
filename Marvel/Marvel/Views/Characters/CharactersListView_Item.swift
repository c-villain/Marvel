//
//  CharactersListView_Item.swift
//  Marvel
//
//  Created by Alexander Kraev on 21.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharactersListView_Item: View {
    
    let name: String?
    let description: String?
    let imageUrl: String?
    
    var placeholder: some View {
        Image(systemName: "photo")
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Group {
                if let imageUrl = imageUrl {
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
            }
            .frame(maxWidth: 90)
            .cornerRadius(6.0)
            
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(name ?? "Unknown hero")
                        .fontWeight(.bold)
                    Text(description ?? "")
                        .fontWeight(.regular)
                        .lineLimit(3)
                }
                Spacer(minLength: 0)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .frame(height: 100)
        .contentShape(Rectangle())
        .padding(16)
    }
}

struct PlainCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CharactersListView_Item(name: "Spider-man",
                               description: "It's a superhero created by writer-editor Stan Lee and writer-artist Steve Ditko",
                               imageUrl: "https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png")
            
            CharactersListView_Item(name: "Big-man",
                               description: nil,
                               imageUrl: "https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png")
        }
    }
}
