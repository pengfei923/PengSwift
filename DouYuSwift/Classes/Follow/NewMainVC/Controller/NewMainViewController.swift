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
        setupUI()
        loadData()
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//
//
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
//        self.navigationController?.navigationBar.shadowImage = nil
//
//
//    }
    
}


extension NewMainViewController {
    override func setupUI() {
        super.setupUI()
        setupTopCollectionView()
        
        isShownavigationBar = true
                
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
