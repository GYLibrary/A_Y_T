//
//  GYParameterEncoding.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/26.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation

open class GYParameterEncoding {
    
    //MARK: - 转化参数为String
    
    class func convertSimpleParams(_ parameters:[String: Any]?) -> String {
        
        var i = 0
        var address:String = ""
        
        if let paras = parameters {
            
            for (key,value) in paras {
                
                if i == 0 {
                    address += "\(key)=\(value)"
                } else {
                    address += "&\(key)=\(value)"
                }
                i += 1
                
            }
            
        }
        return address
    }
    
    /// 转化参数为String
    ///
    /// - parameter parameters:
    ///
    /// - returns: String
    class func convertParams(_ parameters:[String: Any]) -> String {
        
        var componets:[(String,String)] = []
        
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]
            componets += GYParameterEncoding().conventComponents(fromeKey: key, value: value)
            
        }
        
        //将其用&拼接
        return componets.map { "\($0)=\($1)" }.joined(separator:"&")
        
        
    }
    
    private func conventComponents(fromeKey key:String, value: Any) ->[(String,String)] {
        
        var components:[(String,String)] = []
        
        if let dictionary = value as? [String: Any] {
            
            for (nestedKy,value) in dictionary {
                components += conventComponents(fromeKey: "\(key)[\(nestedKy)]", value: value)
            }
            
        } else if let array = value as? [Any] {
            for value in array {
                components += conventComponents(fromeKey: "\(key)[]", value: value)
            }
        } else if let value = value as? NSNumber {
            if value.isBool {
                components.append((escape(key),escape((value.boolValue ? "1" : "0"))))
            } else {
                components.append((escape(key),escape("\(value)")))
            }
        } else if let bool = value as? Bool {
            components.append((escape(key),escape((bool ? "1" : "0"))))
        } else {
            components.append((escape(key),escape("\(value)")))
        }
        
        return components
    }
    
    private func escape(_ string: String) -> String {
        
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        
        return string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? string
        
    }
}

// mark: -
extension NSNumber {
    fileprivate var isBool: Bool {
        return CFBooleanGetTypeID() == CFGetTypeID(self)
    }
}

