//
//  Tools.swift
//  GYVideo
//
//  Created by ZGY on 2017/2/8.
//  Copyright © 2017年 GYJade. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/2/8  14:42
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

public func Print<T>(_ message: T,file: String = #file,method: String = #function, line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

class Tools: NSObject {

}
