//
//  NetService.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import Alamofire

class NetService {
    ///
    /// Set  URL Constant
    ///
    static let BASE_URL = "https://api.themoviedb.org/3"
    static let BASE_URL_IMAGE = "https://image.tmdb.org/t/p/w500"
    static let API_KEY = "4a9efe3f169b365590bdddb65adb5ddc"
    ///
    /// Request API
    ///
    /// - Parameter request: from URLRequestConvertible
    /// - Parameter decoder
    /// - Parameter onSuccess: Closure to catch success response
    /// - Parameter onError: Closure to catch error response
    ///
    static func request<T: Decodable>(
        request: URLRequestConvertible,
        decoder: JSONDecoder = JSONDecoder(),
        onSuccess: @escaping(_ response: T)-> Void,
        onError: @escaping(_ response: [String: AnyObject])->Void) {
        AF.request(request).validate().responseDecodable(decoder: decoder) {(response: DataResponse<T, AFError>) in
            switch response.result {
            case .success(let result):
                onSuccess(result)
            case .failure(_):
                if let data = response.data {
                    if let json = try? (JSONSerialization.jsonObject(with:data , options: []) as! [String: AnyObject]) {
                        onError(json)
                    }
                }
            }
        }
    }
}
