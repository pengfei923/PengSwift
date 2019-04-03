//
//  BannerModelView.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/4/2.
//  Copyright © 2019 hoomsun. All rights reserved.
//

import UIKit

class BannerModelView {
    lazy var bannerModels : [BannerModel] = [BannerModel]()
}

extension BannerModelView {
    func requestBannerData(finishCallBack:@escaping ()->()) {
        NetworkTools.requestPostData(url: "http://weisha.fanjiedata.com:9093/web/banner/banner.do") { (result) in
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            for dict in dataArray {
                let bannerModels = BannerModel(dict: dict)
            self.bannerModels.append(bannerModels)
            }
            print("这里是我返回的数据信息：\(dataArray)再看看其他的问题：\(self.bannerModels)")
            for i in 0 ..< self.bannerModels.count {
                print("\(self.bannerModels[i].bannerurl)")
            }
            finishCallBack()
        }
    }
}
