//
//  Initializator.swift
//  Marvel
//
//  Created by Alexander Kraev on 21.11.2021.
//

import Foundation
import MarvelNetwork

final class Initializator: Serviceable {

    init() { }
    
    func initialize() {
        // Network
        OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory()
    }
}
