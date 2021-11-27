//
//  IdentifiableUrl.swift
//  Marvel
//
//  Created by c-villain on 24.11.2021.
//

import Foundation
import MarvelNetwork

public struct IdentifiableUrl: Identifiable, Hashable {
    public let id = UUID().uuidString
    public let url: String
    public let type: String
}
