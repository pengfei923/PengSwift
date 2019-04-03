//
//  NewMainViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/4/2.
//  Copyright © 2019 hoomsun. All rights reserved.
//

import UIKit

class NewMainViewController: BaseViewController {
    
    private var collectionView : NewMainTopCollectionView?
    
    private lazy var bannerModelView : BannerModelView = BannerModelView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "新的首页界面"
        setupUI()
        
        loadData()
    }
}


extension NewMainViewController {
    override func setupUI() {
        super.setupUI()
        setupTopCollectionView()
    }
    
    private func setupTopCollectionView() {
        collectionView = NewMainTopCollectionView.setupNewMainTopCollection()
        self.view.addSubview(collectionView!)
    }
}

extension NewMainViewController {
    private func loadData() {
        bannerModelView.requestBannerData {
            self.collectionView?.bannerModels = self.bannerModelView.bannerModels
            self.loadDataFinished()
        }
    }
}
