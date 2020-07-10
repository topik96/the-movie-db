//
//  DiscoverParam.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class DiscoverParam {
    var apiKey: String?
    var language: String?
    var sortyBy: String?
    var page: Int?
    var withGenres: Int?
    
    init(){}
    
    func asParam()-> [String: Any] {
        return [
            "api_key": apiKey ?? "",
            "language": language ?? "",
            "sort_by": sortyBy ?? "",
            "page": page ?? 1,
            "with_genres": withGenres ?? 0
        ]
    }
}
