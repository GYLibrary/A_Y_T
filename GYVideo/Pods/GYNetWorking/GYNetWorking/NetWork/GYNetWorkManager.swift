//
//  GYNetWorkManager.swift
//  GYNetWorkING
//
//  Created by zhuguangyang on 16/10/26.
//  Copyright © 2016年 Giant. All rights reserved.
//

import Foundation


class GYNetWorkManager {
    
    let method: GYNetWorkMethod!
    let params: [String: Any]?
    let url:String!
    let callBack:RequestCompletion?
    let resultBack: SuccessAndFailureResult?
    var request:URLRequest
    let session = URLSession.shared
    var task: URLSessionDataTask!
    
    /// 服务器请求超时时间设置
    var timeOut: TimeInterval = 20
    
    init(url:String!, method: GYNetWorkMethod,params: [String: Any]?,callBack:@escaping RequestCompletion)
    {
        self.url = url
        self.method = method
        self.params = params
        self.callBack = callBack
        self.request = URLRequest.init(url: URL(string: url)!)
        self.request.timeoutInterval = timeOut
        self.resultBack = nil
    }
    
    init(url:String!, method: GYNetWorkMethod,params: [String: Any]?,resultBack:@escaping SuccessAndFailureResult)
    {
        self.url = url
        self.method = method
        self.params = params
        self.resultBack = resultBack
        self.request = URLRequest.init(url: URL(string: url)!)
        self.request.timeoutInterval = timeOut
        self.callBack = nil
        
    }
    
    
    func buildRequest() {
        if self.method == .GET && self.params != nil {
            self.request = URLRequest.init(url: URL(string: self.url + "?" + GYParameterEncoding.convertSimpleParams(self.params))!)
            self.request.timeoutInterval = timeOut
        }
        request.httpMethod = self.method.rawValue
        
        if self.params != nil {
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
    }
    
    func buildBody() {
        if self.params != nil && self.method != .GET {
            self.request.httpBody = GYParameterEncoding.convertSimpleParams(self.params).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        }
    }
    
    func fireTask(isBool:Bool) {
        
        task = session.dataTask(with: self.request, completionHandler: { (data, response, error) in
            
            if isBool {
                let reslut: GYResult<Any> = self.serializaResponseJSON(data: data, response: response as! HTTPURLResponse?, error: error)
                print(reslut)
                self.resultBack!(reslut)
            } else {
               self.callBack!(data, response, error)
            }

        })
        task.resume()
        
    }
    
    
    /// 未解析结果
    func startFire() {
        
        buildRequest()
        buildBody()
        fireTask(isBool: false)
        
    }
    
    func resuluFire() {
        buildRequest()
        buildBody()
        fireTask(isBool: true)
    }
    
    
    /// 返回成功和失败的结果
    ///
    /// - parameter data:     data description
    /// - parameter response: response description
    /// - parameter error:    error description
    ///
    /// - returns: return value description
    func serializaResponseJSON( data: Data?,response: HTTPURLResponse?,error:Error?) -> GYResult<Any> {
        
        guard error == nil else {
            return .failure(error!)
        }
        
        if let response = response, emptyDataStatusCodes.contains(response.statusCode){
            return .sucess(NSNull())
        }
        
        guard let validData = data, validData.count > 0 else {
            return .failure(GYError.responseSerializationFailed(reason: .inputDataNilOrZeroLength))
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: validData, options: JSONSerialization.ReadingOptions.allowFragments)
            return .sucess(json)
        } catch {
            return .failure(GYError.responseSerializationFailed(reason: .jsonSerializationFailed(error: error)))
        }
    }
    
}

private let emptyDataStatusCodes: Set<Int> = [204, 205]
