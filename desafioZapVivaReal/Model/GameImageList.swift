//
//  GameImage.swift
//  desafioZapVivaReal
//
//  Created by Mac on 12/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//
import Foundation
import ObjectMapper

final class GameImageList: Mappable {

    var boxImages: GameImages?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        boxImages <- map["box"]
    }
    
    
}
