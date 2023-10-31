//
//  AppDelegate.swift
//  EIMiniProgramSDK
//
//  Created by oauth2 on 10/31/2023.
//  Copyright (c) 2023 oauth2. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let mpOptions = NSMutableDictionary(dictionary: launchOptions ?? [:])
        mpOptions.setValue(NSNumber(value: true), forKey: "debug")
        
        DCUniMPSDKEngine.initSDKEnvironment(launchOptions: mpOptions as! [AnyHashable: Any])
        DCUniMPSDKEngine.setCapsuleButtonHidden(false)
        DCUniMPSDKEngine.setAutoControlNavigationBar(true)
        
        let capsuleButtonStyle = DCUniMPCapsuleButtonStyle.init()
        // 胶囊按钮背景颜色
        capsuleButtonStyle.backgroundColor = "rgba(169,169,169,0.2)"
        // 胶囊按钮 “···｜x” 的字体颜色
        capsuleButtonStyle.textColor = "#FFFFFF"
        // 胶囊按钮按下状态背景颜色
        capsuleButtonStyle.highlightColor = "rgb(203,204,205)"
        // 胶囊按钮边框颜色
        capsuleButtonStyle.borderColor = "rgba(229,229,229,0.3)"
        // 设置样式
        DCUniMPSDKEngine.configCapsuleButtonStyle(capsuleButtonStyle)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

