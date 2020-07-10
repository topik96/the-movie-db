//
//  DiscoverRaw.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class DiscoverRawResponse: Decodable {
    var page, totalResults, totalPages: Int
    var results: [Discover]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decodeIfPresent(Int.self, forKey: .page) ?? 0
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages) ?? 0
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults) ?? 0
        results = try container.decodeIfPresent([Discover].self, forKey: .results) ?? []
    }
}

class Discover: Codable {
    var popularity: Double
    var voteCount: Int
    var video: Bool
    var posterPath: String
    var id: Int
    var adult: Bool
    var backdropPath: String
    var originalLanguage: String
    var originalTitle: String
    var genreIDS: [Int]
    var title: String
    var voteAverage: Double
    var overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 0.0
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? 0
        video = try container.decodeIfPresent(Bool.self, forKey: .video) ?? false
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult) ?? false
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage) ?? ""
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage) ?? 0.0
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS) ?? []
    }
}
