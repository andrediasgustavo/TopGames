//
//  TopGamesCollectionViewCell.swift
//  desafioZapVivaReal
//
//  Created by Mac on 07/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import Kingfisher

protocol FavoriteGame {
    func favoriteGame(cell: TopGamesCollectionViewCell)
}

class TopGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var delegate: FavoriteGame?
    var isFavorite = false
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    func setup(game: Game) {
        let url = URL(string: (game.gameImageList?.boxImages?.bannerMedium)!)
        self.gameImage.kf.setImage(with: url)
        self.gameName.text = game.gameName?.name!
        
        if game.isFavorite {
            self.favoriteButton.setImage(UIImage(named: "favoriteGame"),  for: .normal)
        } else {
            self.favoriteButton.setImage(UIImage(named: "notFavorite"),  for: .normal)
        }
       
    }
    
  
    @IBAction func favoriteGame(_ sender: Any) {
        
        self.delegate?.favoriteGame(cell: self)
    }
}
