//
//  GameDetailViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import Kingfisher

class GameDetailViewController: UIViewController {
    
    @IBOutlet weak var gameName: UILabel?
    @IBOutlet weak var gameImage: UIImageView? {
        didSet {
            print("teste... image")
            
        }
    }
    
    @IBOutlet weak var gameVisualization: UILabel?
    var gameNameText: String?
    var gameImageView: UIImageView?
    
    var gameVisualizationText: String?
    var game: Game?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.gameName?.text = self.gameNameText
        let url = URL(string: (self.game?.gameImageList?.boxImages?.bannerMedium)!)
        self.gameImage?.kf.setImage(with: url!)
//        self.gameImage?.image = self.gameImageView?.image
        self.gameVisualization?.text = self.gameVisualizationText
        self.view.layoutIfNeeded()
        self.view.updateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameName?.text = self.gameNameText
        self.gameImage?.image = self.gameImageView?.image
        self.gameVisualization?.text = self.gameVisualizationText
        self.view.layoutIfNeeded()
        self.view.updateConstraints()
    }
    
    func setupVC(game: Game) {
        self.game = game
        self.gameNameText = game.gameName?.name!
        let url = URL(string: (game.gameImageList?.boxImages?.bannerMedium)!)
        self.gameImageView?.kf.setImage(with: url!)
        self.gameVisualizationText = String(game.visualizations!)
        self.view.layoutIfNeeded()
        self.view.updateConstraints()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
}
