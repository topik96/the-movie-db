//
//  GenrePresent.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

protocol GenreRequest {
    func getGenre()
}

protocol GenreResponse: class {
    func resultGetGenre(success: Bool, object: GenreRawResponse)
    func errorGetGenre(success: Bool, object: ErrorRawResponse)
}

struct GenrePresent: GenreRequest {
//    init() {}
    weak var output: GenreResponse?
    
    func getGenre() {
        MoviesWorker.getGenre(onSuccess: {res in
            self.output?.resultGetGenre(success: true, object: res)
        }, onFailure: { error in
            self.output?.errorGetGenre(success: false, object: error)
        })
    }
}
