//
//  Initializator.swift
//  Marvel
//
//  Created by c-villain on 21.11.2021.
//

import Foundation
import MarvelNetwork

final class Initializator: Serviceable {

    init() {
        // Network
        OpenAPIClientAPI.requestBuilderFactory = MarvelRequestBuilderFactory()
    }
}
