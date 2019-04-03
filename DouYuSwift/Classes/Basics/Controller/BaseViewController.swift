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
        super.viewDidLoad()
    }
}

extension BaseViewController {
    @objc func setupUI() {
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "button_back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "button_back")
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        
        contentView?.isHidden = true
        view.addSubview(animImagView)
        animImagView.startAnimating()
        self.view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished() {
        animImagView.stopAnimating()
        animImagView.isHidden = true
        contentView?.isHidden = false
    }
    
}
