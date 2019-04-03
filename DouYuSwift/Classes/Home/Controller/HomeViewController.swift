//
//  HomeViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    // 初始化
    private lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = {
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, chlidVcs: childVcs, parentViewController: self)
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
    }
    
}
// MARK:- 设置UI界面
extension HomeViewController {
    private func setupUI() {
        //不需要调整内边距
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        view.addSubview(pageTitleView)
        
        view.addSubview(pageContentView)
    }
    
    private func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "")
        
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem.createItem(imageName: "", highImageImage: "", size: size)
        let searchItem = UIBarButtonItem.createItem(imageName: "", highImageImage: "", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "", highImageImage: "", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem];
    }
}
