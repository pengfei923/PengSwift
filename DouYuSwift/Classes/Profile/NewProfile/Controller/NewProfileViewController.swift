//
//  NewProfileViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/27.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit
import Presentr
class NewProfileViewController: UIViewController,LiveViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

extension NewProfileViewController {
    private func setupUI() {
        title = "new profile"
        view.backgroundColor = UIColor.white
        
        let btn = UIButton(title: "测试Presenter", frame: CGRect(x: 20, y: 100, width: kScreenW - 40, height: 44), corner: 5)
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        view.addSubview(btn)
        
    }
    
    @objc func clickBtn(sender:UIButton) {
//        let presentr = Presentr(presentationType: .custom(width: ModalSize.full, height: ModalSize.custom(size: Float(kScreenH - 40)), center: ModalCenterPosition.custom(centerPoint: CGPoint(x: kScreenW/2, y: (kScreenH+40)/2))))
        let presentr = Presentr(presentationType: .bottomHalf)
        let home = LiveViewController()
        home.delegate = self
        home.getBlock { (value) in
            print("这里是我返回的数据信息\(value)")
        }
//        let navi = UINavigationController(rootViewController: home)
        customPresentViewController(presentr, viewController: home, animated: true)
        
    }
    
}

extension NewProfileViewController {
    func didPushText(text: String) {
        print("\(text)")
    }
}
