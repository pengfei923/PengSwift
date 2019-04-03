//
//  FollowTopView.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/26.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class FollowTopView: UIView {
    
    class func setupFollowTopView() -> FollowTopView {
        let view = Bundle.main.loadNibNamed("FollowTopView", owner: nil, options: nil)?.first as! FollowTopView
        view.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 200)
        return view
    }

}
