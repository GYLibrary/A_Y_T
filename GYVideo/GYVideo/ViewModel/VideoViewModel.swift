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
//  Current Time:  2017/2/8  14:16
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import GYNetWorking
import ObjectMapper

class VideoViewModel: BaseViewModel {

    
    
    func getVideoList(_ url:String) {
        
        requestForJSONResult(GYNetWorkMethod.POST, url: url, params: nil) { (result) in
            
            switch result! {
            case .sucess(let value):
                
                self.setValueData(value)
                
                
            case .failure(let error):
                if self.errorBlock != nil {
                    self.errorBlock!(error)
                }
                
            }
            
        }
        
        
    }
    
    
    private func setValueData(_ value:Any){
        
        let value1 = value as! [String : Any]
        
        let dataArr = value1["videoList"]
        
        ///转化为Model数组
        let arr = Mapper<VideoModel>().mapArray(JSONArray: dataArr as! [[String : Any]])
        
        if (arr?.count)! > 0 {
            self.returnBlock!(arr!)
        }
 
    }
    
}
