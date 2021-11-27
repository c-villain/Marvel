//
//  ComicListView_Item.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import SwiftUI
import MarvelNetwork

struct ComicListView_Item: View {
    
    let comicSummary: ComicSummary
    
    @State private var willMoveToComic = false
    
    var body: some View {
        if let name = comicSummary.name {
            Text(name)
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
        }
    }
}
