//
//  LiveNormalModel.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/26.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class LiveNormalModel: NSObject {
    @objc var room_list : [[String : Any]]? {
        didSet {
            guard let room_list = room_list else { return }
            for dict in room_list {
                rooms.append(RoomNormalModel(dict: dict as [String : Any]))
            }
        }
    }
    @objc var tag_name : String = ""
    @objc var icon_name : String = ""
    
    private lazy var rooms : [RoomNormalModel] = [RoomNormalModel]()
    
    init(dict:[String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list" {
//            if let dataArray = value as? [[NSString : Any]] {
//                for dict in dataArray {
//                    rooms.append(RoomNormalModel(dict: dict as [String : Any]))
//                }
//            }
//        }
//    }
}
