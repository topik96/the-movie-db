//
//  DiscoverVC.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit
import SDWebImage

class DiscoverVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var genreID: Int?
    var discovers = [Discover]()
    var networkRequest: DiscoverRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupUI()
        self.networkRequest?.getDiscover(page: 1, genreID: genreID)
    }
    
    func setupUI(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.showLoadingView()
        
        let nib = UINib(nibName: "DiscoverItemCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "CELL_DISCOVER")
    }
}

//MARK:- Response FROM API
extension DiscoverVC: DiscoverResponse {
    override func awakeFromNib() {
        config(vc: self)
    }
    
    func config(vc: DiscoverVC){
        var present = DiscoverPresent()
        present.output = vc
        self.networkRequest = present
    }
    
    func resultGetDiscover(success: Bool, object: DiscoverRawResponse) {
        self.hideLoadingView()
        self.discovers = object.results
        self.collectionView.reloadData()
    }
    
    func errorGetDiscover(success: Bool, object: ErrorRawResponse) {
        self.hideLoadingView()
        self.showAlert(message: object.message)
    }
}

//MARK:- UICollectionViewDataSource
extension DiscoverVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discovers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL_DISCOVER", for: indexPath) as! DiscoverItemCell
        let url = URL(string: NetService.BASE_URL_IMAGE+discovers[indexPath.row].posterPath)
        let placeholder = UIImage(named: "img_placeholder")
        cell.posterImageView.sd_setImage(with: url, placeholderImage: placeholder, options: .waitStoreCache, progress: nil, completed: nil)
        return cell
    }
    
    
}

//MARK:- UICollectionViewDelegate
extension DiscoverVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let discover = discovers[indexPath.row]
        DetailMovieWireframe.push(from: self, discover: discover)
    }
}

extension DiscoverVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width-40)/3
        let height = width+25
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }
    
}
