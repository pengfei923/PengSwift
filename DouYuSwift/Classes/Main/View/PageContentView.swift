//
//  PageContentView.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class PageContentView: UIView {
    
    private let chlidVcs : [UIViewController]
    private let  parentViewController: UIViewController
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        return collectionView
    }()
    
    init(frame: CGRect,chlidVcs:[UIViewController],parentViewController:UIViewController) {
        self.chlidVcs = chlidVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PageContentView {
    private func setupUI() {
        for childVc in chlidVcs {
            parentViewController.addChild(childVc)
        }
        addSubview(collectionView)
        
        
    }
}
