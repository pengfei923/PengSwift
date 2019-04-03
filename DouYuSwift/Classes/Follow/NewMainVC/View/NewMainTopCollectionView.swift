//
//  NewMainTopCollectionView.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/4/2.
//  Copyright © 2019 hoomsun. All rights reserved.
//

import UIKit
import Kingfisher
class NewMainTopCollectionView: UIView {

    var cycleTimer : Timer?
    
//    private lazy var bannerModelView : BannerModelView = BannerModelView()
    
    var bannerModels : [BannerModel]? {
        didSet {
            collectionView.reloadData()
            pageControl.numberOfPages = bannerModels?.count ?? 0
            let indexPath = NSIndexPath(item: (bannerModels?.count ?? 0) * 10, section: 0)
            collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
            
            removeTimer()
            addCycleTimer()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    class func setupNewMainTopCollection() -> NewMainTopCollectionView {
        let view = Bundle.main.loadNibNamed("NewMainTopCollectionView", owner: nil, options: nil)?.first as! NewMainTopCollectionView
        view.frame = CGRect(x: 0, y: kNavigationBarH + kStatusBarH, width: kScreenW, height: 180)
        
        view.setCollectionView()
        view.setPageController()
        
//        view.loadData()
        
        return view
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    private func setPageController() {
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.pageIndicatorTintColor = UIColor.gray
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = .flexibleBottomMargin
        collectionView.register(UINib(nibName: "TopNormalCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TopNormalCollectionCell")
        
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        
    }
    
}


extension NewMainTopCollectionView:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (bannerModels?.count ?? 0) * 1000000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopNormalCollectionCell", for: indexPath) as! TopNormalCollectionCell
        
        cell.imageView.kf.setImage(with: URL(string: (bannerModels?[indexPath.item % bannerModels!.count].bannerurl)!))
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        pageControl.currentPage = Int(offsetX / scrollView.bounds.width) % 3
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        addCycleTimer()
    }
    
}


extension NewMainTopCollectionView {
//    private func loadData() {
//        bannerModelView.requestBannerData {
//            self.pageControl.numberOfPages = self.bannerModelView.bannerModels.count
//            self.collectionView.reloadData()
//
//        }
//    }
}


extension NewMainTopCollectionView {
    private func addCycleTimer() {
        cycleTimer = Timer(timeInterval: 3, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTimer!, forMode: .common)
    }
    
    private func removeTimer() {
        cycleTimer?.invalidate()
        cycleTimer = nil
    }
    
    
    @objc private func scrollToNext() {
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
}
