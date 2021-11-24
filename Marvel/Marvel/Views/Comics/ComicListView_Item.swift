//
//  ComicListView_Item.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import SwiftUI
import MarvelNetwork

struct ComicListView_Item: View {
    
    let comic: IdentifiableComicSummary
    @EnvironmentObject var vm: ComicViewModel
    
    @State private var willMoveToComic = false
    
    var body: some View {
        if let name = comic.name, let url = URL(string: comic.resourceURI?.subscribedUrlString ?? "") {
            
            Text(name)
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
                .onTapGesture {
                    Task {
                        try await vm.comicWith(url)
                        willMoveToComic = true
                    }
                }
                .navigate(to: ComicView(comic: vm.comics.first), when: $willMoveToComic)
            
//            NavigationLink (
//                destination: ComicView(comic: vm.comics.first),
//                label: {
//                    EmptyView()
//                })
        }
    }
}


extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
