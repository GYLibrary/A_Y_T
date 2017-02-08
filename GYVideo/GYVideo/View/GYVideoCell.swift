//
//  GYVideoCell.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/7.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/7  15:54
//  GiantForJade:  Efforts to do my best
//  Real developers ship.


import UIKit

class GYVideoCell: UITableViewCell {

    ///背景图片
    var bgImage: UIImageView?
    /// 标题
    var titleLb: GYLabel?
    ///开始播放按钮
    var startBtn: UIButton?
    ///视频总时间
    var timeLb: GYLabel?
    ///播放次数
    var countLb: GYLabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createSubViews()
    }
    
    fileprivate func createSubViews() {
    
        if titleLb == nil {
            
            titleLb = GYLabel()
            titleLb?.textAlignment = .center
            self.contentView.addSubview(titleLb!)
            
            //如果通过代码来设置Autolayout约束, 必须给需要设置约束的视图禁用autoresizing
            titleLb?.translatesAutoresizingMaskIntoConstraints = false
            
//            let width:NSLayoutConstraint = NSLayoutConstraint(item: titleLb!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: self.frame.width)
            
            let height:NSLayoutConstraint = NSLayoutConstraint(item: titleLb!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 20)
            
            titleLb?.addConstraints([height])
            let top:NSLayoutConstraint = NSLayoutConstraint(item: titleLb!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 10)
            
            let left:NSLayoutConstraint = NSLayoutConstraint(item: titleLb!, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 20)
            
            let right:NSLayoutConstraint = NSLayoutConstraint(item: titleLb!, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: -20)
            
            self.contentView.addConstraints([top,left,right])
            
        }
        
        if bgImage == nil {
            
            bgImage = UIImageView()
            bgImage?.backgroundColor = UIColor.red
            self.contentView.addSubview(bgImage!)
            
            bgImage?.translatesAutoresizingMaskIntoConstraints = false
//            let top: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 40)
            
            let top: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.titleLb!, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1.0, constant: 10)
            
            let bootom: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -30)
            let left: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0)
            
            let right: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0)
            // 因为titleLb的frame未确定，所以调用titleLb会导致crash，需要调取superView
            titleLb?.superview?.addConstraint(top)
            self.contentView.addConstraints([bootom,left,right])
 
        }
        
        if startBtn == nil {

            startBtn = UIButton()
            startBtn?.setBackgroundImage(UIImage(named:"video_play_btn_bg.png"), for: UIControlState.normal)
            self.contentView.addSubview(startBtn!)
            startBtn?.translatesAutoresizingMaskIntoConstraints = false

            let centerX = NSLayoutConstraint(item: startBtn!, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: bgImage, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 1)
            let centerY = NSLayoutConstraint(item: startBtn!, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: bgImage, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 1)
            bgImage?.superview?.addConstraints([centerX,centerY])
            
            let width = NSLayoutConstraint(item: startBtn!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 64)
            let height = NSLayoutConstraint(item: startBtn!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 64)
            
            startBtn?.addConstraints([width,height])
            
        }
        self.contentView.addSubview(timeSumLb)
        timeSumLb.translatesAutoresizingMaskIntoConstraints = false
        var left = NSLayoutConstraint(item: timeSumLb, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 10)
        var bootom = NSLayoutConstraint(item: timeSumLb, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -5)
        
        self.contentView.addConstraints([left,bootom])
        var width = NSLayoutConstraint(item: timeSumLb, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 25)
        var height = NSLayoutConstraint(item: timeSumLb, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 25)
        
        timeSumLb.addConstraints([width,height])
        
        if timeLb == nil {
            timeLb = GYLabel()
            self.contentView.addSubview(timeLb!)
            timeLb?.text = "00:00"
            timeLb?.translatesAutoresizingMaskIntoConstraints = false
            
            let left = NSLayoutConstraint(item: timeLb!, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: timeSumLb, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 8)
            
            let centerY = NSLayoutConstraint(item: timeLb!, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: timeSumLb, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 1)
            
            timeSumLb.superview?.addConstraints([left,centerY])
            
            let width = NSLayoutConstraint(item: timeLb!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
            
            let height = NSLayoutConstraint(item: timeLb!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 22)
            
            timeLb?.addConstraints([width,height])
            
        }
        
        self.contentView.addSubview(readLb)
        readLb.translatesAutoresizingMaskIntoConstraints = false
         left = NSLayoutConstraint(item: readLb, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.timeLb!, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 8)
        timeLb?.superview?.addConstraints([left])
        bootom = NSLayoutConstraint(item: readLb, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -5)
        
        self.contentView.addConstraints([bootom])
        width = NSLayoutConstraint(item: readLb, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 25)
        height = NSLayoutConstraint(item: readLb, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 25)
        
        readLb.addConstraints([width,height])
        
        if countLb == nil {
            
            countLb = GYLabel()
            self.contentView.addSubview(countLb!)
            countLb?.translatesAutoresizingMaskIntoConstraints = false
            countLb?.text = "0"
            
            let left = NSLayoutConstraint(item: countLb!, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: readLb, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 8)
            let centerY = NSLayoutConstraint(item: countLb!, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: readLb, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 1)
            
            readLb.superview?.addConstraints([left,centerY])
            
            let width = NSLayoutConstraint(item: countLb!, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
            let height = NSLayoutConstraint(item: countLb!, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 22)
            
            countLb?.addConstraints([width,height])
            
            
        }
        
        
    }
    
    
    /// 视频总时间
    private lazy var timeSumLb: UIImageView = {
       
        let image = UIImageView()
        image.image = UIImage(named: "time")
        
        return image
    }()
    
    /// 观看次数
    private lazy var readLb: UIImageView = {
        
        let image = UIImageView()
        image.image = UIImage(named: "playcount")
        
        return image
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
