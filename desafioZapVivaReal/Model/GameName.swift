//
//  GameName.swift
//  desafioZapVivaReal
//
//  Created by Mac on 12/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import ObjectMapper

final class GameName: Mappable {

    var name: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
    
}
