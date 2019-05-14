//
//  BaseViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/27.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var contentView : UIView?
    
    var isShownavigationBar : Bool?
    
    #if DEBUG
    
    #endif
    
    #if RELEASE
    
    #endif
    
    fileprivate lazy var animImagView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "待放款"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "待签约")!,UIImage(named: "还款中")!];
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        return imageView
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isShownavigationBar == true {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            
            self.navigationController?.navigationBar.tintColor = UIColor.white
            
            self.view.layer.contents = UIImage(named: "")?.cgImage
        }
   
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isShownavigationBar == true {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
            self.navigationController?.navigationBar.shadowImage = nil
            
            self.navigationController?.navigationBar.tintColor = UIColor.black

        }
        
    }
    
}

extension BaseViewController {
    @objc func setupUI() {

        setNavigationBackItem()
        
//        if isShownavigationBar == true {
//            self.navigationController?.navigationBar.tintColor = UIColor.white
//
//            self.view.layer.contents = UIImage(named: "")?.cgImage
//        }
        
        contentView?.isHidden = true
        view.addSubview(animImagView)
        animImagView.startAnimating()
        self.view.backgroundColor = UIColor(r: 230, g: 230, b: 230)
    }
    
    func setNavigationBackItem() {
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "button_back")
    self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "button_back")
        
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
    }
    
    
    func loadDataFinished() {
        animImagView.stopAnimating()
        animImagView.isHidden = true
        contentView?.isHidden = false
    }
    
}
