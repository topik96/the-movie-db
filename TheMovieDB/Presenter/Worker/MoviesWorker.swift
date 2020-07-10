//
//  MoviesWorker.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class MoviesWorker: NSObject {
    ///
    /// Get genre
    ///
    public static func getGenre(onSuccess: @escaping(_ result: GenreRawResponse)-> Void, onFailure: @escaping (_ error: ErrorRawResponse)->Void) {
        let apiKey = NetService.API_KEY
        let language = "en-US"
        
        NetService.request(request: NetworkMovies.getGenre(apiKey: apiKey, language: language), onSuccess: { (res: GenreRawResponse) in
            onSuccess(res)
        }, onError: {error in
            onFailure(ErrorRawResponse(object: error))
        })
    }
    ///
    /// Get discover
    ///
    /// - Parameter page
    /// - Parameter genreID
    ///
    public static func getDiscover(page: Int, genreID: Int?, onSuccess: @escaping(_ result: DiscoverRawResponse)-> Void, onFailure: @escaping (_ error: ErrorRawResponse)->Void) {
        
        let discoverParam = DiscoverParam()
        discoverParam.apiKey = NetService.API_KEY
        discoverParam.language = "en-US"
        discoverParam.sortyBy = "popularity.asc"
        discoverParam.withGenres = genreID ?? 0
        discoverParam.page = page
        
        NetService.request(request: NetworkMovies.getDiscover(param: discoverParam), onSuccess: { (res: DiscoverRawResponse) in
            onSuccess(res)
        }, onError: {error in
            onFailure(ErrorRawResponse(object: error))
        })
    }
    ///
    /// Get detial movie
    ///
    public static func getDetailMovie(movieID: Int, onSuccess: @escaping(_ result: DetailMovieRawResponse)-> Void, onFailure: @escaping (_ error: ErrorRawResponse)->Void) {
        let apiKey = NetService.API_KEY
        let language = "en-US"
        
        NetService.request(request: NetworkMovies.getDetailMovie(id: movieID, apiKey: apiKey, language: language), onSuccess: { (res: DetailMovieRawResponse) in
            onSuccess(res)
        }, onError: {error in
            onFailure(ErrorRawResponse(object: error))
        })
    }
}
