//
//  IdentifiableComicSummary.swift
//  Marvel
//
//  Created by c-villain on 25.11.2021.
//

import Foundation
import MarvelNetwork

public struct IdentifiableComicSummary: Identifiable, Hashable {
    public let id = UUID().uuidString
    public let resourceURI: String?
    public let name: String?
}
