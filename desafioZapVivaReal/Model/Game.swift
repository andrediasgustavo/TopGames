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
    
    var name: String?
    var banner: String?
    var visualizations: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name           <- map["name"]
        banner         <- map["medium"]
        visualizations <- map["viewers"]
    }
    

}
