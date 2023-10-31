//
//  ViewController.swift
//  EIMiniProgramSDK
//
//  Created by oauth2 on 10/31/2023.
//  Copyright (c) 2023 oauth2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let APPID1 = "__UNI__11E9B73"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        DCUniMPSDKEngine.setDelegate(self)
        checkUniMPResoutce(appid: APPID1)
        
        let uniButton = UIButton()
        uniButton.setTitle("打开小程序", for: .normal)
        uniButton.setTitleColor(.red, for: .normal)
        uniButton.backgroundColor = .cyan
        uniButton.frame = CGRect(x: self.view.frame.midX / 2, y: self.view.frame.midY - 50, width: 200, height: 100)
        uniButton.addTarget(self, action: #selector(self.openUniMP), for: .touchUpInside)
        self.view.addSubview(uniButton)
        
    }

    func checkUniMPResoutce(appid: String) -> Void {
        let wgtPath = Bundle.main.path(forResource: appid, ofType: "wgt") ?? ""
        if DCUniMPSDKEngine.isExistsUniMP(appid) {
            let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
            let name = version["code"]!
            let code = version["code"]!
            print("小程序：\(appid) 资源已存在，版本信息：name:\(name) code:\(code)")
        } else {
            do {
                try DCUniMPSDKEngine.installUniMPResource(withAppid: appid, resourceFilePath: wgtPath, password: nil)
                let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
                let name = version["code"]!
                let code = version["code"]!
                print("✅ 小程序：\(appid) 资源释放成功，版本信息：name:\(name) code:\(code)")
            } catch let err as NSError {
                print("❌ 小程序：\(appid) 资源释放失败:\(err)")
            }
        }
    }
    
    
    /// 打开uni小程序
    @objc func openUniMP() {
        let configuration = DCUniMPConfiguration.init()
        configuration.enableBackground = true
        
        DCUniMPSDKEngine.openUniMP(APPID1, configuration: configuration) { instance, error in
            if instance != nil {
                print("小程序打开成功")
            } else {
                print(error as Any)
            }
        }
    }

}

extension ViewController: DCUniMPSDKEngineDelegate {
    
    func uniMP(onClose appid: String) {
        print("小程序：\(appid) closed")
    }
    
    func defaultMenuItemClicked(_ appid: String, identifier: String) {
        print("defaultMenuItemClicked：\(appid) \(identifier)")
    }
}
