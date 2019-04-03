//
//  ProfileViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "profile"
        print("这里是我获取到的数据信息\(NSDate.getCurrentCommonTime(type: .yyyymmdd))")
        
        
    }
}


extension ProfileViewController {
    
    internal override func setupUI() {
        super.setupUI()
        
        let timer = Timer(timeInterval: 5.0, target: self, selector: #selector(timeBegin), userInfo: self, repeats: true)
        RunLoop.current .add(timer, forMode: RunLoop.Mode.common)
        
    }
    
    
    @objc func timeBegin() {
        loadDataFinished()
        let btn = UIButton(title: "确定", frame: CGRect(x: 20, y: 100, width: kScreenW - 40, height: 44), corner: 5);
        btn.tag = 8
        btn.alpha = 0.8
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        self.view .addSubview(btn)

        let sureBtn = UIButton(title: "确认", frame: CGRect(x: 20, y: 200, width: kScreenW - 40, height: 44))
        sureBtn.addTarget(self, action: #selector(clickSureBtn), for: .touchUpInside)
        self.view .addSubview(sureBtn)
    }
    
    @objc func clickBtn(sender:UIButton) {
        print("点击了打印button按钮\(sender.tag)")
        let alert = UIAlertController(title: "hello", message: "helloKetty", preferredStyle: .alert)
        let cancle = UIAlertAction(title: "取消", style: .cancel) { (cancle) in
            print("点击了取消按钮")
        }
        
        let sure = UIAlertAction(title: "确定", style: .default) { (sure) in
            SVProgressHUD.showInfo(withStatus: "点击了提示按钮")
            print("点击了确认按钮")
        }
        
        alert.addAction(cancle)
        alert.addAction(sure)
        self .present(alert, animated: true, completion: nil)
    }
    
    @objc func clickSureBtn(sender:UIButton) {
        let str = " "
        if Bool.enterStringIsEmptyOp(string: str) {
            print("111111111")
        }else {
            print("222222222")
        }
        
        
        let newProfileVC = NewProfileViewController()
        
        newProfileVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(newProfileVC, animated: true)
    }
    
}
