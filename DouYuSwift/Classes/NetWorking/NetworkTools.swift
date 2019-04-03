//
//  NetworkTools.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit
import Alamofire

class NetworkTools {
    //获取get请求
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

}

