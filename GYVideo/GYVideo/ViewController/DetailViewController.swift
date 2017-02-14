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
import ZFPlayer
import WebKit

class DetailViewController: BaseViewController {
    
    //MARK: - Attributes

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.white
//        MediaManager.sharedInstance.playEmbeddedVideo(url:  URL(string:"http://yyygwz.com/index.php?url=https://v.qq.com/x/cover/jk97cgptoachp45/o0022kxbsz4.html")!, embeddedContentView: view)
        
        #if false
        //BMPlayer
        let player = BMPlayer()
        view.addSubview(player)
        player.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(80)
            make.left.right.equalTo(self.view)
            make.height.equalTo(player.snp.width).multipliedBy(9.0/16.0).priority(750)
        }
        
        player.playWithURL( URL(string:"http://flv2.bn.netease.com/tvmrepo/2017/2/O/P/ECBNDIHOP/SD/ECBNDIHOP-mobile.mp4")!)
        
        if player.backBlock != nil {
            player.backBlock!(true)
        }
        #endif
        #if false
        let playerView = ZFPlayerView()
        playerView.playerLayerGravity = .resizeAspect
        playerView.hasDownload = true
        view.addSubview(playerView)
        
        playerView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(20)
            make.left.right.equalTo(view)
            make.height.equalTo(playerView.snp.width).multipliedBy(9.0/16.0)
        }
        
        let controlView = ZFPlayerControlView()
        
        let playerModel = ZFPlayerModel()
//        playerModel.videoURL = URL(string:"http://pl.youku.com/partner/m3u8?vid=COTY1NjgwNA==&type=hd2&ep=CJ5SdB0FxL9FF0%2FF7Ajc9BWxWXvZmDy0jePlSYdKuVnWOKyFcVpZvA%3D%3D&sid=748696935803286df4793&token=1760&ctype=86&ev=1&oip=1950227395")
           
            
//                playerModel.videoURL = URL(string:"http://k.youku.com/player/getFlvPath/sid/848697273289087df2fa7_00/st/mp4/fileid/03002001005843E577D08B2D9B7D2FDC99DC9F-E083-4998-37A9-690FB5AEBA47?K=5a4a812d98ea4ea4261f8357&hd=1&ts=6417&oip=1950227343&sid=848697273289087df2fa7&token=6235&did=44725c197d3f1dec1eef40da5016a2fd&ev=1&ctype=87&ep=mtnCgorI%2FbZPMVVhUoXnOincIlyWZU59uJD%2B%2FfpEdz487QDdhPfQZHzxy5ys5iL0nCAQS4SCZrQIoElhN%2Fh9u1tuw1zWqPtaMoZcL8P60k5QVaRqVdFfuE3sk4hYpuir")
             playerModel.videoURL = URL(string:"http://112.25.50.175/youku/6971F278C394277FF89E52415/03002001005843E577D08B2D9B7D2FDC99DC9F-E083-4998-37A9-690FB5AEBA47.mp4?sid=848697273289087df2fa7_00&ctype=87")
        playerModel.title = "测试"
        playerModel.fatherView = view
        playerView.playerControlView(controlView, playerModel: playerModel)
        
        playerView.delegate = self
        
        playerView.autoPlayTheVideo()
        #endif
        
        let webView = WKWebView()
        webView.frame = self.view.frame
        webView.load(URLRequest(url: URL(string: "http://www.rejuwang.com/")!))
        
        self.view.addSubview(webView)
        
        
        
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

extension DetailViewController: ZFPlayerDelegate {
    
    
    
}
