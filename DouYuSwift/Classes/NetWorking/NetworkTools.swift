//
//  NetworkTools.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift
import RxAlamofire
import PromiseKit
class NetworkTools {
    
    /// - Parameters: 获取get请求数据的方法
    ///   - url: 链接
    ///   - parameters: 参数
    ///   - finishedCallBack: 回调信息
    class func requestGetData(url:String,parameters:[String:NSString]? = nil,finishedCallBack:@escaping (_ result:Any)->()) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error as Any)
                return
            }
            finishedCallBack(result)
        }
        
    }
    //获取post请求
    class func requestPostData(url:String,parameters:[String:NSString]? = nil,finishedCallBack:@escaping (_ result:Any)->()) {
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error as Any)
                return
            }
            finishedCallBack(result)
        }
    }
    
    class func updateImageToFileData(imageData:Data,fileName:String,uploadUrl:String,finishedCallBack:@escaping (_ result:Any) -> ()) {
        
        let userId = "89ba48e594f84d2db4071efa895afbf2"
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData, withName: "file", fileName: "img.jpg", mimeType: "image/jpeg")
            multipartFormData.append((userId.data(using: String.Encoding.utf8))!, withName: "id")
        }, to: uploadUrl) { (encodingResult) in
            switch encodingResult {
                case .success(let upload,_,_) :
                    upload.responseJSON(completionHandler: { (response) in
                        guard let result = response.result.value else {return}
                        finishedCallBack(result)
                    })
                case .failure(let encodingError) :
                    print(encodingError)
            }
        }
    }
}

