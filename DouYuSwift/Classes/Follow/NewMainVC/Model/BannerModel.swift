//
//  BannerModel.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/4/2.
//  Copyright © 2019 hoomsun. All rights reserved.
//

import UIKit

class BannerModel: NSObject {
    @objc var bannerurl : String = ""
    
    init(dict:[String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
