//
//  GameDetailViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameVisualization: UILabel!
    
    init(game: Game) {
        self.gameName.text = game.name
        self.gameImage.image = UIImage(named: game.banner!)
        self.gameVisualization.text = String(describing: game.visualizations)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
}
