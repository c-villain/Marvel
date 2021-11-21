//
// SeriesList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SeriesList: Codable {

    /** The number of total available series in this list. Will always be greater than or equal to the \"returned\" value. */
    public var available: Int?
    /** The number of series returned in this collection (up to 20). */
    public var returned: Int?
    /** The path to the full list of series in this collection. */
    public var collectionURI: String?
    /** The list of returned series in this collection. */
    public var items: [SeriesSummary]?

    public init(available: Int? = nil, returned: Int? = nil, collectionURI: String? = nil, items: [SeriesSummary]? = nil) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case available
        case returned
        case collectionURI
        case items
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(available, forKey: .available)
        try container.encodeIfPresent(returned, forKey: .returned)
        try container.encodeIfPresent(collectionURI, forKey: .collectionURI)
        try container.encodeIfPresent(items, forKey: .items)
    }
}

