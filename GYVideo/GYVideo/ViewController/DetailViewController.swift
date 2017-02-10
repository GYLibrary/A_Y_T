//
//  DetailViewController.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/10.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/10  14:23
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit
import SnapKit
import BMPlayer

class DetailViewController: UIViewController {
    
    //MARK: - Attributes

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MediaManager.sharedInstance.playEmbeddedVideo(url:  URL(string:"http://yyygwz.com/index.php?url=https://v.qq.com/x/cover/jk97cgptoachp45/o0022kxbsz4.html")!, embeddedContentView: view)
        
        let player = BMPlayer()
        view.addSubview(player)
        player.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(20)
            make.left.right.equalTo(self.view)
            make.height.equalTo(player.snp.width).multipliedBy(9.0/16.0).priority(750)
        }
        
        player.playWithURL( URL(string:"http://flv2.bn.netease.com/tvmrepo/2017/2/O/P/ECBNDIHOP/SD/ECBNDIHOP-mobile.mp4")!)
        
        if player.backBlock != nil {
            player.backBlock!(true)
        }
        
        
        

    }
    
    //MARK: - Override
    
    
    //MARK: - Initial Methods
    
    
    //MARK: - Delegate
    
    
    //MARK: - Target Methods
    
    
    //MARK: - Notification Methods
    
    
    //MARK: - KVO Methods
    
    
    //MARK: - UITableViewDelegate, UITableViewDataSource
    
    
    //MARK: - Privater Methods
    
    
    //MARK: - Setter Getter Methods
    
    
    //MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    deinit {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
