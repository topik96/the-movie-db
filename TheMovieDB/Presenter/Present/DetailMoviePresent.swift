//
//  DetailMoviePresent.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

protocol DetailMovieRequest {
    func getDetail(movieID: Int)
}

protocol DetailMovieResponse: class {
    func resultGetDetail(success: Bool, object: DetailMovieRawResponse)
    func errorGetDetail(success: Bool, object: ErrorRawResponse)
}

struct DetailMoviePresent: DetailMovieRequest {
    weak var output: DetailMovieResponse?
    
    func getDetail(movieID: Int) {
        MoviesWorker.getDetailMovie(movieID: movieID, onSuccess: {res in
            self.output?.resultGetDetail(success: true, object: res)
        }, onFailure: {error in
            self.output?.errorGetDetail(success: false, object: error)
        })
    }
}
