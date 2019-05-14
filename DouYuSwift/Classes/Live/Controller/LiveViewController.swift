//
//  LiveViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit
import Alamofire

//设置代理
protocol LiveViewControllerDelegate {
    func didPushText(text:String)
}

class LiveViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //声明代理
    var delegate : LiveViewControllerDelegate?
    
    
    private lazy var liveVM : LiveViewModel = LiveViewModel()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LiveNormalTableViewCell", bundle: nil), forCellReuseIdentifier: "LiveNormalTableViewCell")
        return tableView
    }()
    // 声明
    typealias textBlock = (String) -> ()
    // 持有
    var block :textBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        loadData()
        
        refreshUI()
        
    }
    
}
// 网络请求
extension LiveViewController {
    @objc private func loadData() {
        liveVM.requestData {
            self.loadDataFinished()
            self.tableView.reloadData()
        }
        
    }
}
// 界面加载
extension LiveViewController {
    internal override func setupUI() {
        super.setupUI()
        navigationItem.title = "直播信息";
        self.view.addSubview(tableView)
    }
}
// 界面UI的刷新
extension LiveViewController {
    private func refreshUI() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.liveVM.livems.removeAll()
            self.loadData()
            self.tableView.mj_header .endRefreshing()
        })
        
    }
}

extension LiveViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liveVM.livems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveNormalTableViewCell", for: indexPath) as! LiveNormalTableViewCell
        let normalModel = liveVM.livems[indexPath.row]
        cell.CenterLabel.text =  "这里是获取的姓名：\(normalModel.tag_name)"
        print(normalModel.tag_name)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("这里是我打印的数据\(indexPath.row)")
        let normalModel = liveVM.livems[indexPath.row]
        // 调用
        if let block = self.block {
            block(normalModel.tag_name)
        }
        
        delegate?.didPushText(text: normalModel.tag_name)
        
        self .dismiss(animated: true, completion: nil)
    }
}


extension LiveViewController {
    // 使用block方法
    func getBlock(block:textBlock?) {
        self.block = block
    }
}
