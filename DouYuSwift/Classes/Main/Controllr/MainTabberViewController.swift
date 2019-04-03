//
//  MainTabberViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/28.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class MainTabberViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
        // Do any additional setup after loading the view.
    }
    
    
    // MARK:- 封装添加storyborad的方法
    private func addChildVC(storyName:String) {
        let childvc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        self.tabBar.tintColor = UIColor.orange
        addChild(childvc)
        
    }

}
