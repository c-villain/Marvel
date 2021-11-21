//
// Url.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Url: Codable {

    /** A text identifier for the URL. */
    public var type: String?
    /** A full URL (including scheme, domain, and path). */
    public var url: String?

    public init(type: String? = nil, url: String? = nil) {
        self.type = type
        self.url = url
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case url
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(url, forKey: .url)
    }
}

