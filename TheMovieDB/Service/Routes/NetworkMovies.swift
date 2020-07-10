//
//  NetworkGenre.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkMovies: URLRequestConvertible {
    
    static let baseURLString = NetService.BASE_URL
    
    case getGenre(apiKey: String, language: String)
    case getDetailMovie(id: Int, apiKey: String, language: String)
    case getDiscover(param: DiscoverParam)
    
    var method: HTTPMethod {
        switch self {
        case .getGenre(_, _):
            return .get
        case .getDiscover(_):
            return .get
        case .getDetailMovie(_,_,_):
            return .get
        }
    }
    
    var res: (path: String, param:[String:Any]) {
        switch self {
        case .getGenre(let apiKey, let language):
            return (Endpoint.GENRE, ["api_key": apiKey, "language": language])
        case .getDiscover(let param):
            return (Endpoint.DISCOVER, param.asParam())
        case .getDetailMovie(let id, apiKey: let apiKey, language: let language):
            return ("\(Endpoint.DETAIL_MOVIE)\(id)", ["api_key": apiKey, "language": language])
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var url: URL?
        var urlRequest: URLRequest?
        url = try NetworkMovies.baseURLString.asURL()
        urlRequest = URLRequest(url: (url?.appendingPathComponent(res.path))!)
        urlRequest?.httpMethod = method.rawValue
        urlRequest = try URLEncoding.default.encode(urlRequest!, with: res.param)
       
        urlRequest?.cachePolicy = .reloadIgnoringCacheData
        return urlRequest!
    }
}
