//
//  GYNetWork.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/26.
//  Copyright © 2016年 Giant. All rights reserved.
//

import UIKit

// MARK: - Data Request

@discardableResult
public func request(str:String) {
    return GYNetWork.request()
}

public class GYNetWork{

    
    public class func request() {
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string:"http://baidu.com")!)
        //超时时间设置
        request.timeoutInterval = 0.1
        let task = session.dataTask(with: request) { (data, response, error) in
            
            print("waif for 5 seconds!")
            sleep(5)
            let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(string)
            
        }
        
        //开始执行
        task.resume()
        
    }
    
    
    /// 网络请求
    ///
    /// - parameter method: 请求方式
    /// - parameter url:    URL
    open  class func request(method:String, url: String) {
        
        let session = URLSession.shared
        
        var request = URLRequest.init(url: URL(string: url)!)
        request.httpMethod = method
        request.httpShouldHandleCookies = false
        let task = session.dataTask(with: request) { (data, response, error) in
            
            print("稍等一下！")
            sleep(5)
            let string = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(string)
            
        }
        
        task.resume()
        
    }
    
    
    /// 网络请求（带返回结果）
    ///
    /// - parameter method:   GET、post
    /// - parameter url:      url description
    /// - parameter callback: callback description
    open  class func request(method: String, url: String,callback: @escaping (_ data:Data?,_ response:URLResponse?,_ error: Error?) -> Void) {
        
        let session = URLSession.shared
        
        var request = URLRequest.init(url: URL(string: url)!)
        request.httpMethod = method
        request.httpShouldHandleCookies = false
        let task = session.dataTask(with: request) { (data, response, error) in
            callback(data, response, error)
        }
        
        task.resume()
        
    }
    
    
    /// 网络请求参数以字典的形式传入
    ///
    /// - parameter method:   请求方式
    /// - parameter url:      url
    /// - parameter params:   请求参数
    /// - parameter callBack: 返回请求结果
    open class func request(method: GYNetWorkMethod, url:String,params: [String: Any],callBack: @escaping RequestCompletion) {
        
        let session = URLSession.shared
        
        var newURl = url
        
        switch method {
        case .GET:
            //如何转化编码的...未知的世界
            //password=Optional%28%22666666%22%29&phone=Optional%28%2215026981614%22%29
//            newURl += "?" + GYParameterEncoding.convertParams(params).replacingOccurrences(of: "Optional", with: "")
            newURl += "?" + GYParameterEncoding.convertSimpleParams(params)
        case .POST:
            break
        default:
            break
        }
        print(newURl)
        print(GYParameterEncoding.convertParams(params))
        var request = URLRequest.init(url: URL(string: newURl)!)
        request.httpMethod = method.rawValue
      
        if method == .POST {
            request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = GYParameterEncoding.convertSimpleParams(params).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            callBack(data, response, error)
        }
        
        task.resume()
        
    }
    
    /// 参数以String的方式传入
    ///
    /// - parameter method:   请求方式
    /// - parameter url:      url
    /// - parameter params:   参数
    /// - parameter callBack: 回调
    open class func request(method: GYNetWorkMethod, url:String,params: String,callBack: @escaping RequestCompletion) {
        
        let session = URLSession.shared
        
        var newURl = url
        
        switch method {
        case .GET:
            newURl += "?" + params
        case .POST:
            break
        default:
            break
        }
        print(newURl)
        var request = URLRequest.init(url: URL(string: newURl)!)
        request.httpMethod = method.rawValue
        
        if method == .POST {
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpBody = params.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            callBack(data, response, error)
            
        }
        
        task.resume()
        
    }
    
}
