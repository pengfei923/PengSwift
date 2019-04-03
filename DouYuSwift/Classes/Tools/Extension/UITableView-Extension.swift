//
//  UITableView-Extension.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/26.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit


extension UITableView {
    class func creatTableView() -> UITableView {
        let tableView = UITableView(frame: UIView.fullScreenBounds(), style: .grouped)
        if #available(iOS 11.0, *) {
            tableView.estimatedSectionHeaderHeight = 0
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
        }
        return tableView
    }
    
    convenience init(rect:CGRect,style:UITableView.Style) {
        self.init(frame: rect, style: style)
        if #available(iOS 11.0, *) {
            estimatedSectionHeaderHeight = 0
            estimatedRowHeight = 0;
            estimatedSectionFooterHeight = 0;
        }
    }
}
