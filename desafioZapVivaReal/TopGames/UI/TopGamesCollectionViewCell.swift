//
//  TopGamesCollectionViewCell.swift
//  desafioZapVivaReal
//
//  Created by Mac on 07/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import Kingfisher

class TopGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var favorited: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    func setup(game: Game) {
        let url = URL(string: (game.gameImageList?.boxImages?.bannerMedium)!)
        self.gameImage.kf.setImage(with: url)
        self.gameName.text = game.gameName?.name!
        self.favorited.image = UIImage(named: "notFavorite")
    }
    
    @IBAction func favoriteGame(_ sender: Any) {
        self.favorited.image = UIImage(named: "favoriteGame")
    }

    
}
