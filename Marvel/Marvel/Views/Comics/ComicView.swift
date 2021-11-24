//
//  ComicView.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import SwiftUI
import MarvelNetwork

struct ComicView: View {
    
    let comic: Comic?
    
    var placeholder: some View {
        Image(systemName: "photo")
    }
    
    var body: some View {
        let imageUrl = "\(comic?.thumbnail?.path ?? "").\(comic?.thumbnail?._extension ?? "")"
        return ScrollView {
            VStack(spacing: 12.0) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(comic?.title ?? "")
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
                    }
                }
                
                if let description = comic?.description, !description.isEmpty {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Overview:")
                            .fontWeight(.bold)
                        
                        Text(description)
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
