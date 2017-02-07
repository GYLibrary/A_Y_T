//
//  GYNetConst.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/27.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation

///好多天了
/// 请求结果回调
public typealias RequestCompletion = (_ data:Data?, _ response:URLResponse?,_ error: Error?) -> Void

public typealias Success = (_ data:Data? , _ response:URLResponse?) -> Void
public typealias Failure = (_ error:Error?) -> Void


/// 请求结果回调（JSON,ERROR）
public typealias SuccessAndFailureResult = (_ result:GYResult<Any>?) -> Void

/// 请求方式
///
/// - GET:  GET
/// - POST: POST
public enum GYNetWorkMethod: String {
    
    case GET = "GET"
    case POST = "POST"
    case Download = "DOWNLOAD"
    case Delete = "Delete"
}


/// 网络请求结果
///
/// - Success:  Success description
/// - Failure:  Failure description
/// - OverTime: OverTime description
public enum GYNetWorState {
    case Success()
    case Failure
    case OverTime
    
}
