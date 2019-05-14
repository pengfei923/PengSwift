//
//  UIButton-Extension.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/26.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title:String,frame:CGRect,corner:CGFloat = 0) {
        self.init(type: .system)
        self.frame = frame
        setTitle(title, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.lightGray, for: .highlighted)
        self.layer.cornerRadius = corner
        self.layer.masksToBounds = true
        backgroundColor = UIColor.red
    }
    
    
    
}

