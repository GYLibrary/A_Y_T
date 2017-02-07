//
//  GYResult.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/27.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation


/// 返回请求结果的Result
///
/// - sucess:  sucess description
/// - failure: failure description
public enum GYResult<Value> {
    
    case sucess(Value)
    case failure(Error)
    
    
    public var isSuccess: Bool {
        switch self {
        case .sucess:
            return true
        case .failure:
            return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value:Value?{
        switch self {
        case .sucess(let value):
            return value
        case .failure:
            return nil
            
        }
    }
    
    public var error: Error? {
        switch self {
        case .sucess:
            return nil
        case .failure(let error):
            return error
            
        }
    }
}

// MARK: - CustomStringConvertible
extension GYResult: CustomStringConvertible {

    public var description: String {
        switch self {
        case .sucess:
            return "SUCCESS"
        case .failure:
            return "FAILURE"
        }
    }
}

// MARK: - CustomDebugStringConvertible
extension GYResult: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        switch self {
        case .sucess(let value):
            return "SUCCESS:\(value)"
        case .failure(let error):
            return "FAILURE:\(error)"
        }
    }
    
}
