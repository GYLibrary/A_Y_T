//
//  GYError.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/27.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation
public enum GYError: Error {
    
    public enum ResponseSerializationFailureReason {
        
        case inputDataNil
        case inputDataNilOrZeroLength
        case inputFileNil
        case inputFileReadFailed(at: URL)
        case stringSerializationFailed(encoding: String.Encoding)
        case jsonSerializationFailed(error: Error)
        case propertyListSerializationFailed(error: Error)
    }
    
    
    case responseSerializationFailed(reason: ResponseSerializationFailureReason)
    
}
