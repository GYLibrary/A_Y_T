//
//  ViewController.swift
//  GYVideo
//
//  Created by zhuguangyang on 2017/2/6.
//  Copyright © 2017年 GYJade. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let player = AVPlayer(url: URL(string:"http://yyygwz.com/index.php?url=https://v.qq.com/x/cover/jk97cgptoachp45/o0022kxbsz4.html")!)
        
        let playerVc = AVPlayerViewController()
        
        playerVc.player = player
        self.addChildViewController(playerVc)
        self.view.addSubview(playerVc.view)
        playerVc.view.frame = view.frame
        
        player.play()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

