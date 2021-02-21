//
//  MovieCell.swift
//  TMDB
//
//  Created by Noor Walid on 21/02/2021.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
    }

    @IBAction func favoriteClicked(_ sender: UIButton) {
    }
}
