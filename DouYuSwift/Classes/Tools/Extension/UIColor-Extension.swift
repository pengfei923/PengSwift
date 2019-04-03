//
//  UIColor-Extension.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

extension UIColor {
    // 便利构造函数
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
