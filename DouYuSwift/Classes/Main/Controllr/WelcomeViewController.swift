//
//  WelcomeViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/28.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController,UIScrollViewDelegate {

    var startClosure: (()->Void)?
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: kScreenW * 4, height: kScreenH)
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
        
    }
}


extension WelcomeViewController {
    private func setupUI() {
        view.addSubview(scrollView)
        for i in 0 ... 4 {
            let image = UIImage(named: "引导页\(i + 1)");
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i) * frame.size.width
            imageView.frame = frame
            
            if i == 3 {
                let btn = UIButton(title: "点击进入", frame: CGRect(x: 20, y: kScreenH - 100, width: kScreenW - 40, height: 44), corner: 5)
                btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
                imageView .addSubview(btn)
                imageView.isUserInteractionEnabled = true
            }
            
            
            scrollView .addSubview(imageView)
        }
    }
    
    @objc func clickBtn() {
        startClosure!()
        print("点击了进入按钮")
    }
    
}


extension WelcomeViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}
