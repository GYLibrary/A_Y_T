//
//  GYRespons.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/27.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation

public struct DataResponse<Value> {
    
    public let result:GYResult<Value>
    
    public init(result: GYResult<Value>) {
        
        self.result = result
        
    }
    
}

// MARK: -

extension DataResponse: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return result.debugDescription
    }
    

    public var debugDescription: String {
        var output: [String] = []
        
        output.append("[Result]: \(result.debugDescription)")
        
        return output.joined(separator: "\n")
    }
}
