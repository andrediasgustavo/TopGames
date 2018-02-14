//
//  FavoriteGamesCollectionViewCell.swift
//  desafioZapVivaReal
//
//  Created by Mac on 07/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import CoreData

class FavoriteGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var favorited: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(game: NSManagedObject) {
        let url = URL(string: (game.value(forKeyPath: "gameImage") as? String)!)
        self.gameImage.kf.setImage(with: url)
        self.gameName.text = game.value(forKeyPath: "gameName") as? String
        self.favorited.image = UIImage(named: "favoriteGame")
    }
    
}

