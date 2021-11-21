//
// StoryDataContainer.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct StoryDataContainer: Codable {

    /** The requested offset (number of skipped results) of the call. */
    public var offset: Int?
    /** The requested result limit. */
    public var limit: Int?
    /** The total number of resources available given the current filter set. */
    public var total: Int?
    /** The total number of results returned by this call. */
    public var count: Int?
    /** The list of stories returned by the call */
    public var results: [Story]?

    public init(offset: Int? = nil, limit: Int? = nil, total: Int? = nil, count: Int? = nil, results: [Story]? = nil) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case offset
        case limit
        case total
        case count
        case results
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(offset, forKey: .offset)
        try container.encodeIfPresent(limit, forKey: .limit)
        try container.encodeIfPresent(total, forKey: .total)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(results, forKey: .results)
    }
}

