//
//  TopGamesDataSource.swift
//  desafioZapVivaReal
//
//  Created by Mac on 10/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import UIKit

protocol TopGamesDelegate: class {
//    func getGames()
}

class TopGamesManager: UICollectionViewFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var games: [Game]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.games?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopGamesCell", for: indexPath) as! TopGamesCollectionViewCell
        cell.setup(game: self.games![indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.frame.width/2), height: 180)
        
    }
    
}
