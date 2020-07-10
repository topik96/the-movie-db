//
//  DetailMovieTableCell.swift
//  TheMovieDB
//
//  Created by topik mujianto on 10/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit
import SDWebImage

class DetailMovieTableCell: UITableViewCell {

    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(_ data: DetailMovieRawResponse?){
        if let data = data {
            let url = URL(string: NetService.BASE_URL_IMAGE+data.backdropPath)
            let placeholder = UIImage(named: "img_placeholder")
            self.posterImageView.sd_setImage(with: url, placeholderImage: placeholder, options: .waitStoreCache, completed: nil)
            self.titleLable.text = "Overview"
            self.overViewLabel.text = data.overview
            self.releaseDateLabel.text = "\(data.status) \(data.releaseDate)"
        }
    }
    
}
