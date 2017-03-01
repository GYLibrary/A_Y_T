//
//  GYLabel.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/7.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/7  16:09
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class GYLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = UIFont.systemFont(ofSize: 16.0)
        self.textColor = UIColor.black
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
