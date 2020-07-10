//
//  DiscoverPresent.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

protocol DiscoverRequest {
    func getDiscover(page: Int, genreID: Int?)
}

protocol DiscoverResponse: class {
    func resultGetDiscover(success: Bool, object: DiscoverRawResponse)
    func errorGetDiscover(success: Bool, object: ErrorRawResponse)
}

struct DiscoverPresent: DiscoverRequest {
    weak var output: DiscoverResponse?
    
    func getDiscover(page: Int = 1, genreID: Int?) {
        MoviesWorker.getDiscover(page: page, genreID: genreID, onSuccess: {res in
            self.output?.resultGetDiscover(success: true, object: res)
        }, onFailure: {error in
            self.output?.errorGetDiscover(success: false, object: error)
        })
    }
}
