//
//  HomeViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/25.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire
import PromiseKit
private let kTitleViewH : CGFloat = 40



class HomeViewController: UIViewController {
    
    let disposed = DisposeBag()
    
    let timer = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
    
    let countDownStopped = Variable(true)
    let leftTime = Variable(Int(30))
    
    
    
    // 初始化
    private lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    
    private lazy var pageContentView : PageContentView = {
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, chlidVcs: childVcs, parentViewController: self)
        return contentView
    }()
    
    private lazy var button : UIButton = {
        let button = UIButton(title: "测试button的系统方法", frame: CGRect(x: 20, y: 200, width: kScreenW - 40, height: 44), corner: 0);
        
        return button
    }()
    
    private lazy var textField : UITextField = {
        let textField = UITextField(placeHolder: "请输入用户名", frame: CGRect(x: 20, y: 300, width: kScreenW - 40, height: 40));
        return textField
    }()
    
    private lazy var pwdTextField : UITextField = {
        let pwdTextField = UITextField(placeHolder: "请输入密码", frame: CGRect(x: 20, y: 360, width: kScreenW - 40, height: 40))
        return pwdTextField
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 420, width: kScreenW - 40, height: 40))
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var s : UISwitch = {
        let s = UISwitch(frame: CGRect(x: 20, y: 500, width: 60, height: 30))
        
        return s
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
    }
    
}
// MARK:- 设置UI界面
extension HomeViewController {
    private func setupUI() {
        //不需要调整内边距
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        view.addSubview(pageTitleView)
        
        view.addSubview(pageContentView)
        
        view.addSubview(textField)
        view.addSubview(pwdTextField)
        view.addSubview(label)
        view.addSubview(s)
        
        s.rx.isOn.asObservable().subscribe(onNext: { (event) in
            print("当前开关状态:\(event)")
        }, onError: { (error) in
            
        }).disposed(by: disposed)
        
        s.rx.isOn.bind(to: button.rx.isEnabled).disposed(by: disposed)
        
        _ = button.rx.tap.subscribe { (nil) in
            print("点击了解信息")
        }
        
        _ = button.rx.tap.subscribe { (event) in
            
            let image = UIImage(named: "待放款")
//            let imageData = UIImage.jpegData(image!)
            let imageData = image?.jpegData(compressionQuality: 0.5)
            
            NetworkTools.updateImageToFileData(imageData: imageData!, fileName: "img.jpg", uploadUrl: "http://weisha.fanjiedata.com:9093/web/upload/uploadimg.do", finishedCallBack: { [weak self](result) in
                print("这里是我返回的结果信息\(result)")
                self!.noticeTop("noticeTop", autoClear: true, autoClearTime: 1)
            })
//
        }
        
        let  a = [1,2,3,4,5,6]
        let b = a.map({$0 * $0})
        print("这里是我返回的bbbbbbbbbb:\(b)")
        
        let array = ["Apple","Orange","Grape",""]
        let arr1 = array.map { (a) -> Int in
            let length = a.count
//            guard length > 0 else {
//                return
//            }
            return length
        }
        
        print("arr1\(arr1)")
        
        
        let arr2 = array.flatMap { (a) -> String in
            let length = a
            //            guard length > 0 else {
            //                return
            //            }
            return length
        }
        
        print("arr2:\(arr2)")
        
        
        let mq = [1,2,3,4]
        
        let m = mq.map { $0 * 2
        }
        
        print("这里是我返回的数据\(m)")
        
        let string = "lipengfei"
        let strbegin = string.prefix(2)
        print("\(strbegin)")
        
        
        
        
        
        
//        _ = textField.rx.text.orEmpty
//            .map{ $0.count > 5 && $0.count < 11
//            }.share(replay: 1).subscribe(onNext: {[weak self](bool) in
//                self?.button.isEnabled = bool
//                self?.button.backgroundColor = bool == true ? UIColor.red : UIColor.gray
//            }, onError: { (error) in
//
//            }, onCompleted: {
//
//            }, onDisposed: {
//
//            })
//
//        _ = textField.rx.text.subscribe(onNext: { (string) in
//            print("这里是我返回的数据信息\(string ?? "你好")")
//        }, onError: { (error) in
//
//        }, onCompleted: {
//
//        }, onDisposed: {
//
//        })
        
//        button.rx.tap.subscribe(onNext: { [weak self](_) in
//            self!.startClicked()
//        }, onError: { (error) in
//
//        }).disposed(by: disposed)
        
        s.rx.value.bind(to: UIApplication.shared.rx.isNetworkActivityIndicatorVisible).disposed(by: disposed)
        
        textField.rx.controlEvent([.editingDidEnd]).asControlEvent().subscribe(onNext: { [weak self](_) in
            self!.pwdTextField.becomeFirstResponder()
        }, onError: { (error) in
            
        }).disposed(by: disposed)
        
        pwdTextField.rx.controlEvent([.editingDidEnd]).asControlEvent().subscribe(onNext: { [weak self](_) in
            self!.pwdTextField.resignFirstResponder()
        }, onError: { (error) in
            
        }).disposed(by: disposed)
        
        
        Observable.combineLatest(leftTime.asObservable(), countDownStopped.asObservable()){
           [weak self] leftTimeValue,countDownStoppedValue in
            if countDownStoppedValue {
                self!.button.backgroundColor = UIColor.red
                self!.button.isEnabled = true
                return "开始"
            }else {
                self!.button.backgroundColor = UIColor.gray
                self!.button.isEnabled = false
                return "倒计时开始，还有\(leftTimeValue) 秒"
                
            }
        }.bind(to: button.rx.title()).disposed(by: disposed)
        
//        button.rx.tap.bind { [weak self] in
//            self?.startClicked()
//        }.disposed(by: disposed)
        
//        _ = button.rx.title() <-> <String>self.leftTime
        
//        button.rx.tap.subscribe(onNext: { (_) in
//            print("click button")
//        }, onError: { (error) in
//
//        }).disposed(by: disposed)
//
//        _ = button.rx.tap.bind{ _ in
//            print("bind click button")
//        }
        
//        timer.map{"计数\($0)"}.bind(to: button.rx.title(for: .normal)).disposed(by: disposed)
////
//        timer.map{"计数\($0)"}.bind(to: label.rx.text).disposed(by: disposed)
        
//        let userField = textField.rx.text.orEmpty
//            .map{$0.count > 5 && $0.count < 11}
//            .share(replay: 1)
//
//        let pwdField = pwdTextField.rx.text.orEmpty
//            .map{$0.count > 10 && $0.count < 20}
//            .share(replay: 1)
        
//        _ = Observable
//            .combineLatest(userField, pwdField) {$0&&$1}
//            .share(replay: 1)
//            .subscribe(onNext: {[weak self] (bool) in
//                self?.button.isEnabled = bool // 修改按钮是否可以点击
//                self?.button.backgroundColor =  bool == true ?  UIColor.red :  UIColor.gray
//                }, onError: { (error) in
//            }, onCompleted: nil, onDisposed: nil)
//
//
//        _ = Observable
//            .combineLatest(userField,pwdField) {$0&&$1}
//            .share(replay: 1)
//            .subscribe(onNext: { [weak self](bool) in
//                self?.button.isEnabled = bool
//                self?.button.backgroundColor = bool == true ? UIColor.red : UIColor.gray
//            }, onError: { (error) in
//
//            }, onCompleted: nil, onDisposed: nil)
        
//        let urlString = "https://www.douban.com/j/app/radio/channels"
//        let url = URL(string: urlString)
//        let request = URLRequest(url: url!)
        //创建并发起请求
        
//        request(.get, url!)
//            .data()
//            .subscribe(onNext: {
//                data in
//                //数据处理
//                let str = String(data: data, encoding: String.Encoding.utf8)
//                print("返回的数据是：", str ?? "")
//            }).disposed(by: disposed)
        
        
        button.rx.tap.subscribe(onNext: {(_) in
//            request(.get, url!).data().subscribe(onNext: { (data) in
//                let str = String(data: data, encoding: .utf8)
//                print("这里是我返回的数据信息\(String(describing: str))")
//            }, onError: { (error) in
//
//            }).disposed(by: self!.disposed)
//            NetworkTools.requestRxGetData(url: urlString, finishedCallBack: { (data) in
//                print("这里是返回的数据信息：data\(data)")
//            })
//            requestJSON(.get, url!).subscribe(onNext: { (response,data) in
////                print("这里是我返回的数据信息:\(data["channels"] ?? "")")
//
//
//            }, onError: { (error) in
//
//            }).disposed(by: self!.disposed)
//            URLSession.shared.rx.json(request: request).subscribe(onNext: { (data) in
//                let json = data as! [String : Any]
//                print(json)
//            }, onError: { (error) in
//
//            }).disposed(by: self!.disposed)
        }, onError: { (error) in
            
        }).disposed(by: disposed)
        
//        button.rx.tap.asObservable().flatMap {
//            URLSession.shared.rx.data(request: request)
//            }.map{
//                try JSONSerialization.jsonObject(with: $0, options: .allowFragments) as! [String : Any]
//            }.subscribe(onNext: { (data) in
//                print("请求成功\(data)")
//            }, onError: { (error) in
//
//            }).disposed(by: disposed)
        
        
        
//
        setupButtonUI()
    }
    
    private func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "")
        
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem.createItem(imageName: "", highImageImage: "", size: size)
        let searchItem = UIBarButtonItem.createItem(imageName: "", highImageImage: "", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "", highImageImage: "", size: size)
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem];
    }
}

extension HomeViewController {
    private func setupButtonUI() {
        
        view.addSubview(button)
    }
    
    @objc private func clickSureButton(sender:UIButton) {
        print("点击了sureButton按钮")
    }
    
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
//    func startClicked() {
//        self.countDownStopped.value = false
//            timer.takeUntil(countDownStopped.asObservable().filter{$0})
//            .subscribe(onNext: { [weak self](event) in
//                self!.leftTime.value -= 1
//                print("这里是剩余的时间:\(self?.leftTime.value ?? 0)")
//                if (self!.leftTime.value == 0) {
//                    print("倒计时结束")
//                    self!.countDownStopped.value = true
//                    self!.leftTime.value = 30
//                }
//            }, onError: { (error) in
//
//            }).disposed(by: disposed)
//    }
    
}


extension HomeViewController {
    private func alamofireData() {
        NetworkTools.requestGetData(url: "<#T##String#>") { (a) in
            
        }
    }
}
