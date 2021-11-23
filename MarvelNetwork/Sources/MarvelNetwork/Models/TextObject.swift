//
// TextObject.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TextObject: Codable, Hashable {

    /** The canonical type of the text object (e.g. solicit text, preview text, etc.). */
    public var type: String?
    /** The IETF language tag denoting the language the text object is written in. */
    public var language: String?
    /** The text. */
    public var text: String?

    public init(type: String? = nil, language: String? = nil, text: String? = nil) {
        self.type = type
        self.language = language
        self.text = text
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case language
        case text
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(language, forKey: .language)
        try container.encodeIfPresent(text, forKey: .text)
    }
}

