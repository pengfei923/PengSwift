//
//  ExtensionViewController.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/4/1.
//  Copyright © 2019 hoomsun. All rights reserved.
//

import UIKit

import AVFoundation
import MediaPlayer

class ExtensionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    private let  imagePickerController: UIImagePickerController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Extension"
        self.view.backgroundColor = UIColor.white
        
//        let oneInch = 25.4.km
//
//        print("\(oneInch)")
        
        imagePickerController?.modalTransitionStyle = .flipHorizontal
        imagePickerController?.allowsEditing = true
        imagePickerController?.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        
        let sureButton = UIButton(title: "调用相机", frame: CGRect(x: 20, y: 200, width: kScreenW - 40, height: 44), corner: 5)
        sureButton.addTarget(self, action: #selector(clickSureButton), for: .touchUpInside)
        self.view.addSubview(sureButton)
        
    }
    
}

extension ExtensionViewController {
    @objc private func clickSureButton(sender:UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController?.sourceType = .camera
            self.present(imagePickerController!, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self .dismiss(animated: true, completion: nil)
    }
    
}

extension ExtensionViewController {
    // 泛型函数加入关键字 inout
    func swapTwoValues<T> (_ a : inout T,_ b : inout T) {
        
    }
}

//extension Double {
//    var km : Double {
//        return self * 1_000.00
//
//    }
//    var m : Double {
//        return self
//
//    }
//    var cm : Double {
//        return self / 100.0
//    }
//
//    var mm : Double {
//        return self / 1_000.0
//    }
//
//    var ft : Double {
//        return self / 3.28048
//    }
//
//}
