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
import GYNetWorking
import DGElasticPullToRefresh
import MJRefresh

class ViewController: BaseViewController {

    var tableView: UITableView?
    var dataArr: [VideoModel] = [] {
        didSet{
            
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
            
            
        }
    }
    
    var pageIndex:NSInteger!
    var viewModel: VideoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let player = AVPlayer(url: URL(string:"http://yyygwz.com/index.php?url=https://v.qq.com/x/cover/jk97cgptoachp45/o0022kxbsz4.html")!)
//        http://flv2.bn.netease.com/tvmrepo/2017/2/O/P/ECBNDIHOP/SD/ECBNDIHOP-mobile.mp4
  /*      let player = AVPlayer(url: URL(string:"http://flv2.bn.netease.com/tvmrepo/2017/2/O/P/ECBNDIHOP/SD/ECBNDIHOP-mobile.mp4")!)
        let playerVc = AVPlayerViewController()
        
        playerVc.player = player
        self.addChildViewController(playerVc)
        self.view.addSubview(playerVc.view)
        playerVc.view.frame = view.frame
        
        player.play()
    */
       
        instanceUI()
        
        instanceData()
        
        
        
//        VideoModel.getVideoList("http://c.m.163.com/nc/video/home/0-10.html")
        
        
    }
    
    private func instanceUI() {
        
        tableView = UITableView(frame: self.view.bounds)
        tableView?.tableFooterView = UIView()
        //        tableView?.separatorStyle = .none
        tableView?.backgroundColor = UIColor.white
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        tableView?.register(GYVideoCell.self, forCellReuseIdentifier: NSStringFromClass(GYVideoCell.self))
        pageIndex = 0
    }
    
    private func instanceData() {
        
        weak var weakSelf = self
        viewModel = VideoViewModel({ (success) in
            Print(success)
            weakSelf?.tableView?.mj_header.endRefreshing()
            weakSelf?.tableView?.mj_footer.endRefreshing()
            
            if weakSelf?.pageIndex == 0 {
                
                weakSelf?.dataArr.removeAll()
                weakSelf?.dataArr.append(contentsOf: (success as AnyObject) as! [VideoModel])
            } else {
                
                weakSelf?.dataArr.append(contentsOf: (success as AnyObject) as! [VideoModel])
            }
            
            
        }, errorBlock: { (error) in
            weakSelf?.tableView?.mj_header.endRefreshing()
            weakSelf?.tableView?.mj_footer.endRefreshing()
            Print(error)
        }) { (_) in
            weakSelf?.tableView?.mj_header.endRefreshing()
            weakSelf?.tableView?.mj_footer.endRefreshing()
        }
        
        viewModel.getVideoList("http://c.m.163.com/nc/video/home/0-10.html")
        
        /*
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        tableView?.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            
            self?.pageIndex = 1
            viewModel.getVideoList("http://c.m.163.com/nc/video/home/0-10.html")
            self?.tableView?.dg_stopLoading()
            
        }, loadingView: loadingView)
        */
        
        tableView?.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { [weak self] () -> Void in
            self?.pageIndex = 0
            self?.viewModel.getVideoList("http://c.m.163.com/nc/video/home/0-10.html")
        
        })
        
        tableView?.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: { [weak self] () -> Void in
            
            self?.pageIndex = (weakSelf?.pageIndex)! + 1
            self?.viewModel.getVideoList(NSString.init(format: "http://c.m.163.com/nc/video/home/%d-10.html", (weakSelf?.pageIndex)!) as String)
            
        })
        
        
    }
    
    deinit {
        
        tableView?.dg_removePullToRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(GYVideoCell.self)) as! GYVideoCell

        cell.selectionStyle = .none
        
        let model = dataArr[indexPath.row] as VideoModel
        
        cell.reloadData(model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          
        let cellHeight: CGFloat = 280
        let current = scrollView.contentOffset.y

        let totalItem = cellHeight * CGFloat(CGFloat(pageIndex) + 0.7) * 10 - 64
//        let newThreshold = needRead / totalItem
        Print("\(current),\(totalItem),页数:\(pageIndex)")
        if current >= totalItem {
            
            pageIndex = pageIndex + 1
            
            viewModel.getVideoList(NSString.init(format: "http://c.m.163.com/nc/video/home/%d-10.html", pageIndex) as String)
            
        }
        
    }
    
}
