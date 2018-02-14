//
//  Game.swift
//  desafioZapVivaReal
//
//  Created by Mac on 06/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import ObjectMapper

final class Game: Mappable {
    
    var visualizations: Int?
    var gameName: GameName?
    var gameImageList: GameImageList?
    var isFavorite = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        gameName           <- map["game"]
        gameImageList      <- map["game"]
        visualizations <- map["viewers"]
    }
    

}
