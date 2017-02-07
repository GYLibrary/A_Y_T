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
    var timeLb: UILabel?
    ///播放次数
    var countLb: UILabel?
    
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
            let top: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 40)
            
            let bootom: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -30)
            let left: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 0)
            
            let right: NSLayoutConstraint = NSLayoutConstraint(item: bgImage!, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: 0)
            
//            bgImage?.addConstraint(top)
            self.contentView.addConstraints([top,bootom,left,right])
            
            
        }
        
        
    }
    
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
