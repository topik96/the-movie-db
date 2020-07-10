//
//  Meta.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation

class ErrorRawResponse {
    var code: Int
    var success: Bool
    var message: String
    
    init(object: [String: AnyObject]){
        code = object["status_code"] as? Int ?? 0
        message = object["status_message"] as? String ?? ""
        success = object["success"] as? Bool ?? false
    }
}
