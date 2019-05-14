//
//  FollowViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class FollowViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    private lazy var tableView : UITableView =  {
        let tableView = UITableView(rect: UIView.fullScreenBounds(), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FollowNormalCell", bundle: nil), forCellReuseIdentifier: "FollowNormalCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "我的";
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
// UI界面的设置
extension FollowViewController {
    internal override func setupUI() {
        super.setupUI()
        view.addSubview(tableView)
        
        let topView = FollowTopView.setupFollowTopView()
        self.tableView.tableHeaderView = topView
    }
}
// TableView delegate & dataSource
extension FollowViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowNormalCell", for: indexPath) as! FollowNormalCell
        cell.accessoryType = .disclosureIndicator
        if indexPath.row == 0 && indexPath.section == 0 {
            cell.leftLabel.text = "扩展"
            cell.rightLabel.text = "扩展详情"
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.leftLabel.text = "banner"
                cell.rightLabel.text = "banner详情"
            }else if indexPath.row == 1 {
                cell.leftLabel.text = "collection"
                cell.rightLabel.text = "collection详情"
            }else if indexPath.row == 2 {
                cell.leftLabel.text = "ReSwift"
                cell.rightLabel.text = "ReSwift详情"
            }else if indexPath.row == 3 {
                cell.leftLabel.text = "注册"
                cell.rightLabel.text = "注册控制器"
            }else {
                cell.leftLabel.text = "hello"
                cell.rightLabel.text = "ketty"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 && indexPath.section == 0 {
            let extensionVC = ExtensionViewController()
            extensionVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(extensionVC, animated: true)
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let newMainVC = NewMainViewController()
                newMainVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(newMainVC, animated: true)
            }else if indexPath.row == 1 {
                let newCollectionVC = NewCollectionViewController()
                newCollectionVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(newCollectionVC, animated: true)
            }else if indexPath.row == 2 {
                let reSwift = ReSwiftViewController()
                reSwift.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(reSwift, animated: true)
            }else if indexPath.row == 3 {
                let newregVC = NewRegisterViewController()
                newregVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(newregVC, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.001;
    }
}
