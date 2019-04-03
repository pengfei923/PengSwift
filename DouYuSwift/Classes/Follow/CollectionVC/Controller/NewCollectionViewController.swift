//
//  NewCollectionViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/4/2.
//  Copyright © 2019 hoomsun. All rights reserved.
//

import UIKit

class NewCollectionViewController: BaseViewController {

    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (kScreenW - 40) / 3, height: (kScreenW - 40) / 3)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: UIView.fullScreenBounds(), collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UINib(nibName: "NewCollectionNormalViewCell", bundle: nil), forCellWithReuseIdentifier: "NewCollectionNormalViewCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection"
        setupUI()
    }
}


extension NewCollectionViewController {
    override func setupUI() {
        super.setupUI()
        //防止下拉看不到数据信息
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        
        loadDataFinished()
    }
}


extension NewCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionNormalViewCell", for: indexPath) as! NewCollectionNormalViewCell
        cell.numLabel.text = "\(indexPath.item)"
        return cell
    }
    
    
    
}
