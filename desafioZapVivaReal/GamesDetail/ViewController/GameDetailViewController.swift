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
    @IBOutlet weak var gameImage: UIImageView?
    @IBOutlet weak var gameVisualization: UILabel?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var gameView: UIView!
    
    var gameNameText: String?
    var gameImageView: UIImageView?
    var gameVisualizationText: String?
    var game: Game?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.gameView.isHidden = true
        self.activityIndicator.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var rightFavoriteBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.backgroundImage(UIImage(named: "notFavorite")), target: self, action: #selector(favoriteGame))
//        navigationItem.setRightBarButton(rightFavoriteBarButtonItem, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.gameName?.text = self.gameNameText
        let url = URL(string: (self.game?.gameImageList?.boxImages?.bannerLarge)!)
        self.gameImage?.kf.setImage(with: url!)
        self.gameVisualization?.text = "Número de visualizações: \(String(describing: self.gameVisualizationText!))"
        self.setNavigationTitle()
        self.view.layoutIfNeeded()
        self.view.updateConstraints()
        self.gameView.isHidden = false
        self.activityIndicator.stopAnimating()
    }
    
    func setNavigationTitle() {
        let navLabel = UILabel()
        navLabel.numberOfLines = 2
        navLabel.textAlignment = .center
        let navTitle = NSMutableAttributedString(string: self.gameNameText!, attributes:[
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: "Roboto-Bold", size: 18)!])
        navLabel.attributedText = navTitle
        self.navigationItem.titleView = navLabel
    }

    func setupVC(game: Game) {
        self.game = game
        self.gameNameText = game.gameName?.name!
        self.gameVisualizationText = String(game.visualizations!)
        self.view.layoutIfNeeded()
        self.view.updateConstraints()
    }
    
    func favoriteGame() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
}
