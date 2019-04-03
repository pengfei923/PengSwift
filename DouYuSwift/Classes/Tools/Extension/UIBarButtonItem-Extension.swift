//
//  UIBarButtonItem-Extension.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    // 类方法
    class func createItem(imageName:String,highImageImage:String,size:CGSize) ->UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageImage), for: .highlighted)
        btn.frame = CGRect(origin: .zero, size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    
    //便利构造函数
    convenience init(imageName:String,highImageImage:String = "",size:CGSize = .zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if highImageImage != "" {
            btn.setImage(UIImage(named: highImageImage), for: .highlighted)
        }
        if size == .zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: .zero, size: size)
        }
        self.init(customView:btn)
    }
    
}
