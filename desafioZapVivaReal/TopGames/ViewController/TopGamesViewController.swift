//
//  topGamesViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class TopGamesViewController: UIViewController  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var manager: TopGamesManager?
    var delegate: TopGamesDelegate?
    var apiRequest: APIRequest?
    var page: Int?
    var games: [Game]?

    
    init(delegate: TopGamesDelegate, page: Int, apiRequest: APIRequest) {
         super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        self.page = page
        self.apiRequest = apiRequest
        self.manager = TopGamesManager()
    
        self.getGames()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.collectionView.dataSource = self.manager
        self.collectionView.delegate = self.manager
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
        view.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getGames() {
        
        self.apiRequest?.getGames(page: self.page!, completion: { (gamesResult) in
          
            for game in gamesResult {
                self.manager?.games?.append(game)
            }
        })
//        self.collectionView.layoutIfNeeded()
    }
    
   
}
