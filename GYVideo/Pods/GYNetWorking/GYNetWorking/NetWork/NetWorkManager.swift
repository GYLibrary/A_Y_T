//
//  NetWorkManager.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/26.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation

//消除未使用返回值的警告
//@discardableResult

/// 通用方法(返回NSData,response,error)
///
/// - parameter method:   method description
/// - parameter url:      url description
/// - parameter params:   params description
/// - parameter callBack: callBack description
public func request(_ method: GYNetWorkMethod,url: String!,params:[String: Any]?,callBack:@escaping RequestCompletion) {
    
    let manager = GYNetWorkManager(url: url, method: method, params: params, callBack: callBack)
    manager.startFire()
    
}


/// 通用方法(返回JSON -> GYResult)
///
/// - parameter method:     method description
/// - parameter url:        url description
/// - parameter params:     params description
/// - parameter resultBack: resultBack description
public func requestForJSONResult(_ method: GYNetWorkMethod,url: String!,params:[String: Any]?,resultBack:@escaping SuccessAndFailureResult) {
    
    let manager = GYNetWorkManager(url: url, method: method, params: params, resultBack: resultBack)
    //
    manager.resuluFire()
    
}

/// 带参数的GET请求
///
/// - parameter url:      url description
/// - parameter params:   params description
/// - parameter callBack: callBack description
public func request(_ url: String!,params:[String: Any],callBack: @escaping RequestCompletion){
    let manager = GYNetWorkManager(url: url, method: .GET, params: params, callBack: callBack)
    manager.startFire()
    
}


class NetWorkManager {

    /// 通用方法
    ///
    /// - parameter method:   method description
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func request(method: GYNetWorkMethod,url: String!,params:[String: Any],callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: method, params: params, callBack: callBack)
        manager.startFire()
        
    }
    
    
    /// 带参数的GET请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func GET(url: String!,params:[String: Any],callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .GET, params: params, callBack: callBack)
        manager.startFire()
        
    }
    
    
    /// 不带参数的GET请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func GET(url: String!,callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .GET, params: nil, callBack: callBack)
        manager.startFire()
        
    }
    
    /// 带参数的POST请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func POST(url: String!,params:[String: Any],callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .POST, params: params, callBack: callBack)
        manager.startFire()
        
    }
    
    /// 不带参数的GET请求
    ///
    /// - parameter url:      url description
    /// - parameter params:   params description
    /// - parameter callBack: callBack description
    class func POST(url: String!,callBack: @escaping RequestCompletion) {
        let manager = GYNetWorkManager(url: url, method: .POST, params: nil, callBack: callBack)
        manager.startFire()
        
    }
}
