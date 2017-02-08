//
//  VideoModel.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/8.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/8  13:32
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import ObjectMapper

class BaseModel: Mappable {
    
    var cover: String?
    var title: String?
    var length: String?
    var playCount: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        cover <- map["cover"]
        title <- map["title"]
        length <- map["length"]
        playCount <- map["playCount"]
        
    }

}
