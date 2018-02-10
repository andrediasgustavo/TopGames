//
//  FavoriteGamesCollectionViewCell.swift
//  desafioZapVivaReal
//
//  Created by Mac on 07/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class FavoriteGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    
    func setup(game: Game) {
        self.gameName.text = game.name
        self.gameImage.image = UIImage(named: game.banner!)
    }
    
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

