//
//  DemoView.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/20.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/20  14:43
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class DemoView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    /// 重写layerClass
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

}
