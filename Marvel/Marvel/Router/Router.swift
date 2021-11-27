//
//  Router.swift
//  Marvel
//
//  Created by c-villain on 27.11.2021.
//

import SwiftUI

final class Router: ObservableObject {
    
    enum Screens {
        case comic
        case empty
    }
    
    @Published var currentScreen: Screens = .empty
    @Published var transition: AnyTransition = .opacity
}

extension AnyTransition {
    static let slideForward = asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    static let slideBackward = asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
}
