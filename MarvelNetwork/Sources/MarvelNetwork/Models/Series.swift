//
// Series.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Series: Codable {

    /** The unique ID of the series resource. */
    public var id: Int?
    /** The canonical title of the series. */
    public var title: String?
    /** A description of the series. */
    public var description: String?
    /** The canonical URL identifier for this resource. */
    public var resourceURI: String?
    /** A set of public web site URLs for the resource. */
    public var urls: [Url]?
    /** The first year of publication for the series. */
    public var startYear: Int?
    /** The last year of publication for the series (conventionally, 2099 for ongoing series) . */
    public var endYear: Int?
    /** The age-appropriateness rating for the series. */
    public var rating: String?
    /** The date the resource was most recently modified. */
    public var modified: Date?
    public var thumbnail: Image?
    public var comics: ComicList?
    public var stories: StoryList?
    public var events: EventList?
    public var characters: CharacterList?
    public var creators: CreatorList?
    public var next: SeriesSummary?
    public var previous: SeriesSummary?

    public init(id: Int? = nil, title: String? = nil, description: String? = nil, resourceURI: String? = nil, urls: [Url]? = nil, startYear: Int? = nil, endYear: Int? = nil, rating: String? = nil, modified: Date? = nil, thumbnail: Image? = nil, comics: ComicList? = nil, stories: StoryList? = nil, events: EventList? = nil, characters: CharacterList? = nil, creators: CreatorList? = nil, next: SeriesSummary? = nil, previous: SeriesSummary? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.resourceURI = resourceURI
        self.urls = urls
        self.startYear = startYear
        self.endYear = endYear
        self.rating = rating
        self.modified = modified
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.events = events
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
        case startYear
        case endYear
        case rating
        case modified
        case thumbnail
        case comics
        case stories
        case events
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
        try container.encodeIfPresent(startYear, forKey: .startYear)
        try container.encodeIfPresent(endYear, forKey: .endYear)
        try container.encodeIfPresent(rating, forKey: .rating)
        try container.encodeIfPresent(modified, forKey: .modified)
        try container.encodeIfPresent(thumbnail, forKey: .thumbnail)
        try container.encodeIfPresent(comics, forKey: .comics)
        try container.encodeIfPresent(stories, forKey: .stories)
        try container.encodeIfPresent(events, forKey: .events)
        try container.encodeIfPresent(characters, forKey: .characters)
        try container.encodeIfPresent(creators, forKey: .creators)
        try container.encodeIfPresent(next, forKey: .next)
        try container.encodeIfPresent(previous, forKey: .previous)
    }
}

