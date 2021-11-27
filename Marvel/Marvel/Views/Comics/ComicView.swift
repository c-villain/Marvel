//
//  ComicView.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import SwiftUI
import MarvelNetwork

struct ComicView: View {
    
    @StateObject var vm: ComicViewModel
    
    var placeholder: some View {
        Image(systemName: "photo")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12.0) {
                VStack(spacing: 8.0) {
                    Text(vm.comic?.title ?? "")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.accentColor)
                    AsyncImage(url: .init(string: vm.imageUrl ?? "")) { phase in
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
                }
                
                if let description = vm.comic?.description, !description.isEmpty {
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
        .padding(.horizontal, 16.0)
        .task {
            do {
                try await vm.comic()
            } catch {
                print("error")
            }
        }
    }
}
