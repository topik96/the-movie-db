//
//  UIViewController.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    func configNavigationBar(with title: String){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = title
    }
    
    func showLoadingView(with message: String? = nil){
        startAnimating(CGSize(width: 60, height: 60), message: message, messageFont: nil, type: .ballPulse, color: .white, padding: nil, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: nil, textColor: .white, fadeInAnimation: .none)
    }
    
    func hideLoadingView(){
        stopAnimating()
    }
    
    func showAlert(title: String? = nil, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

