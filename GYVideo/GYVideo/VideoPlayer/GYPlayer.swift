//
//  GYPlayer.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/10.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/10  15:22
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import AVFoundation
import SnapKit

enum GYPlayerError:Error {
    case SetCategoryError
    case ActivationError
}

class GYPlayer: UIView {
    
    var player:AVPlayer!
    
    var playerLayer:AVPlayerLayer!
    
    /// 管理子View
    var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        instancePlayer()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        instancePlayer()
        
    }
    
    
    fileprivate func instancePlayer() {
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch let error {
            Print(error)
        }
        
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            Print(error)
        }

        contentView = UIView()
        contentView.backgroundColor = UIColor.black
        addSubview(contentView)
        
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
