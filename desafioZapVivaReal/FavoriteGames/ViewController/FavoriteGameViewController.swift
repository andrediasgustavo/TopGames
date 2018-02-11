//
//  FavoriteGameViewController.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class FavoriteGameViewController: UIViewController  {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: FavoriteGamesManager?
    var delegate: FavoriteGamesDelegate?
    
    
    init(dataSource: FavoriteGamesManager, delegate: FavoriteGamesDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = dataSource
        self.collectionView.delegate = dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

