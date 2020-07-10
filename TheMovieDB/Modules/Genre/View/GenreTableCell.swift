//
//  GenreTableCell.swift
//  TheMovieDB
//
//  Created by topik mujianto on 09/07/20.
//  Copyright © 2020 Feebe. All rights reserved.
//

import UIKit

class GenreTableCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.genreImageView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
