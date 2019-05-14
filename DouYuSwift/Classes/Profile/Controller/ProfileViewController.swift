//
//  ProfileViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit
import PGDatePicker
class ProfileViewController: BaseViewController {
    
    private lazy var btn : UIButton = {
        let btn = UIButton(title: "确定", frame: CGRect(x: 20, y: 100, width: kScreenW - 40, height: 44), corner: 5);
        btn.tag = 8
        btn.alpha = 0.8
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        return btn;
    }()
    
    private lazy var sureBtn : UIButton = {
        let sureBtn = UIButton(title: "确认", frame: CGRect(x: 20, y: 200, width: kScreenW - 40, height: 44))
        sureBtn.addTarget(self, action: #selector(clickSureBtn), for: .touchUpInside)
        return sureBtn;
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 300, width: 40, height: 40))
        return imageView
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 300, width: 100, height: 40))
        label.text = "你好"
        return label
    }()

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
        
        self.view.addSubview(btn)
        
        self.view.addSubview(sureBtn)
        
        self.view.addSubview(imageView)
        
        let image = #imageLiteral(resourceName: "待签约")
        imageView.image = image
        
        
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        
//        let bezierPath = UIBezierPath(roundedRect: CGRect(x: 20, y: 400, width: 60, height: 60), byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: 60, height: 60))

    }
    
    
    
    @objc func clickBtn(sender:UIButton) {
        let datePickManager = PGDatePickManager()
        datePickManager.isShadeBackgroud = true
        let datePicker = datePickManager.datePicker!
        datePicker.datePickerMode = .date
        datePicker.delegate = self
        self.present(datePickManager, animated: false, completion: nil)
        
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


extension ProfileViewController:PGDatePickerDelegate {
    func datePicker(_ datePicker: PGDatePicker!, didSelectDate dateComponents: DateComponents!) {
        print("这里是我返回的信息\(dateComponents!)")
    }
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
}
