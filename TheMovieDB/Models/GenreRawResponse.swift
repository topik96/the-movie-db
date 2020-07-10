//
//  Genre.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class GenreRawResponse: Decodable {
    var genres = [Genre]()
    
    enum CodingKeys: String, CodingKey {
        case genres
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genres = try container.decodeIfPresent([Genre].self, forKey: .genres) ?? []
    }
}

class Genre: Decodable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    }
}
