//
//  DiscoverWireframe.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import Foundation
import UIKit

class DiscoverWireframe {
    static func push(from vc: UIViewController, genre: Genre){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let discoverVC = storyboard.instantiateViewController(withIdentifier: "SB_DISCOVER") as! DiscoverVC
        discoverVC.genreID = genre.id
        discoverVC.configNavigationBar(with: genre.name)
        
        vc.navigationController?.pushViewController(discoverVC, animated: true)
    }
}
