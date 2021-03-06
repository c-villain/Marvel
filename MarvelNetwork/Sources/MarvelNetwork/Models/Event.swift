//
// Event.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Event: Codable, Hashable {

    /** The unique ID of the event resource. */
    public var id: Int?
    /** The title of the event. */
    public var title: String?
    /** A description of the event. */
    public var description: String?
    /** The canonical URL identifier for this resource. */
    public var resourceURI: String?
    /** A set of public web site URLs for the event. */
    public var urls: [Url]?
    /** The date the resource was most recently modified. */
    public var modified: Date?
    /** The date of publication of the first issue in this event. */
    public var start: Date?
    /** The date of publication of the last issue in this event. */
    public var end: Date?
    public var thumbnail: Image?
    public var comics: ComicList?
    public var stories: StoryList?
    public var series: SeriesList?
    public var characters: CharacterList?
    public var creators: CreatorList?
    public var next: EventSummary?
    public var previous: EventSummary?

    public init(id: Int? = nil, title: String? = nil, description: String? = nil, resourceURI: String? = nil, urls: [Url]? = nil, modified: Date? = nil, start: Date? = nil, end: Date? = nil, thumbnail: Image? = nil, comics: ComicList? = nil, stories: StoryList? = nil, series: SeriesList? = nil, characters: CharacterList? = nil, creators: CreatorList? = nil, next: EventSummary? = nil, previous: EventSummary? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.resourceURI = resourceURI
        self.urls = urls
        self.modified = modified
        self.start = start
        self.end = end
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.series = series
        self.characters = characters
        self.creators = creators
        self.next = next
        self.previous = previous
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case description
        case resourceURI
        case urls
        case modified
        case start
        case end
        case thumbnail
        case comics
        case stories
        case series
        case characters
        case creators
        case next
        case previous
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(resourceURI, forKey: .resourceURI)
        try container.encodeIfPresent(urls, forKey: .urls)
        try container.encodeIfPresent(modified, forKey: .modified)
        try container.encodeIfPresent(start, forKey: .start)
        try container.encodeIfPresent(end, forKey: .end)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(comics, forKey: .comics)
        try container.encodeIfPresent(stories, forKey: .stories)
        try container.encodeIfPresent(series, forKey: .series)
        try container.encodeIfPresent(characters, forKey: .characters)
        try container.encodeIfPresent(creators, forKey: .creators)
        try container.encodeIfPresent(next, forKey: .next)
        try container.encodeIfPresent(previous, forKey: .previous)
    }
}

