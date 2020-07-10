//
//  DetailMovieWireframe.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import UIKit

class DetailMovieWireframe {
    static func push(from vc: UIViewController, discover: Discover){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailMovieVC = storyboard.instantiateViewController(withIdentifier: "SB_DETAIL_MOVIE") as! DetailMovieVC
        detailMovieVC.discover = discover
        
        vc.navigationController?.pushViewController(detailMovieVC, animated: true)
    }
}
