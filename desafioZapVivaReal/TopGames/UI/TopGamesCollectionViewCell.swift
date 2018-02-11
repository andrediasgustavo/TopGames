//
//  TopGamesCollectionViewCell.swift
//  desafioZapVivaReal
//
//  Created by Mac on 07/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class TopGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var favorited: UIImageView!
    
    func setup(game: Game) {
        self.gameName.text = game.name
        self.gameImage.image = UIImage(named: game.banner!)
        self.favorited.image = UIImage(named: "")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}
