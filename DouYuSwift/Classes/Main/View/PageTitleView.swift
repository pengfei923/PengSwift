//
//  PageTitleView.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

private let KscrollLineH : CGFloat = 2

class PageTitleView: UIView {
    
    private var titles : [String]
    
    private lazy var titleLabels : [UILabel] = [UILabel]()
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine  : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    init(frame: CGRect,titles:[String]) {
        
        self.titles = titles
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PageTitleView {
    private func setupUI() {
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        setupTitleLabels()
        
        setupBottomMenuAndScrollLine()
        
    }
    
    private func setupTitleLabels() {
        
        let labelY : CGFloat = 0
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - KscrollLineH
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
        }
    }
    
    private func setupBottomMenuAndScrollLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KscrollLineH, width: firstLabel.frame.width, height: KscrollLineH)
    }
    
}
