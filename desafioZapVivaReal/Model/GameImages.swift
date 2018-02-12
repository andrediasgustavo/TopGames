//
//  GameImages.swift
//  desafioZapVivaReal
//
//  Created by Mac on 12/02/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation
import ObjectMapper

final class GameImages: Mappable {
    
    var bannerSmall: String?
    var bannerMedium: String?
    var bannerLarge: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        bannerSmall   <- map["small"]
        bannerMedium  <- map["medium"]
        bannerLarge   <- map["large"]
    }
    
    
}

