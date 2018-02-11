//
//  FavoriteGamesManager.swift
//  desafioZapVivaReal
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//


import Foundation
import UIKit

class FavoriteGamesManager: UICollectionViewFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var games: [Game]
    
    init(games: [Game]) {
        self.games = games
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteGamesCell", for: indexPath) as! FavoriteGamesCollectionViewCell
        cell.setup(game: self.games[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2), height: 180)
        
    }
    
}


