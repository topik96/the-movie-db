//
//  GenreWireframe.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import UIKit

class GenreWireframe {
    static func initRoot()-> UINavigationController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let genreVC = storyboard.instantiateViewController(withIdentifier: "SB_GENRE") as! GenreVC
        let navController = UINavigationController(rootViewController: genreVC)
        return navController
    }
}
