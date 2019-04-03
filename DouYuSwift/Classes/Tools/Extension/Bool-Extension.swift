//
//  Bool-Extension.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/27.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

extension Bool {
    // 判断字符串是否为空
    static func enterStringIsEmptyOp(string:String?) -> Bool {
        let str = string?.trimmingCharacters(in: .whitespaces)
        if str == nil || str == "" {
            return true
        }
        return false
    }
    // 判断是否是邮箱
    static func enterIsEmail(email:String?) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: email)
        return (isValid ? true : false)
    }
    // 判断是否是手机号码
    static func enterIsPhone(phone:String?) -> Bool {
        let regex = "/^1[0-9]{10}$/"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isPhone = predicate.evaluate(with: phone)
        return (isPhone ? true : false)
    }
}
