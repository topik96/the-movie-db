//
//  DetailMovieRawResponse.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class DetailMovieRawResponse: Decodable {
    var adult: Bool
    var backdropPath: String
    var budget: Int
    var genres: [Genre]
    var homepage: String
    var id: Int
    var imdbID, originalLanguage, originalTitle, overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var revenue, runtime: Int
    var status, tagline, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult) ?? false
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
        budget = try container.decodeIfPresent(Int.self, forKey: .budget) ?? 0
        genres = try container.decodeIfPresent([Genre].self, forKey: .genres) ?? []
        homepage = try container.decodeIfPresent(String.self, forKey: .homepage) ?? ""
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage) ?? ""
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 0.0
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle) ?? ""
        revenue = try container.decodeIfPresent(Int.self, forKey: .revenue) ?? 0
        runtime = try container.decodeIfPresent(Int.self, forKey: .runtime) ?? 0
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
        tagline = try container.decodeIfPresent(String.self, forKey: .tagline) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        video = try container.decodeIfPresent(Bool.self, forKey: .video) ?? false
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage) ?? 0.0
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? 0
    }
}
