//
//  LiveViewModel.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/26.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class LiveViewModel {
    lazy var livems : [LiveNormalModel] = [LiveNormalModel]()
}

extension LiveViewModel {
    func requestData(finishCallBack:@escaping ()->()) {
        NetworkTools.requestGetData(url: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit":"4","offset":"4","time":NSDate.getCurrentTime() as NSString]) { (result) in
            
            guard let resultDict = result as? [String : Any] else {return}
            
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            for dict in dataArray {
                let liveModels = LiveNormalModel(dict: dict as! [String : NSObject])
                self.livems.append(liveModels)
                
                for liveModels in self.livems {
                    print(liveModels.tag_name)
                }
                finishCallBack()
            }
        }
    }
}
