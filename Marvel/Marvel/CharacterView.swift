//
//  CharacterView.swift
//  Marvel
//
//  Created by c-villain on 21.11.2021.
//

import SwiftUI
import MarvelNetwork

struct CharacterView: View {
    
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
            .frame(height: 100)
            .frame(maxWidth: 90)
            
            VStack(alignment: .leading, spacing: 12) {
                Text(name ?? "Unknown hero").fontWeight(.bold)
                Text(description ?? "")
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
            }
        }
        .frame(height: 100)
        .padding(16)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(name: "Spider-man",
                      description: "It's a superhero created by writer-editor Stan Lee and writer-artist Steve Ditko",
                      imageUrl: "https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png")
    }
}
