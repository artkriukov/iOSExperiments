//
//  AppDelegate.swift
//  AppLifecycleSandbox
//
//  Created by Artem Kriukov on 28.10.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let time = Date().formattedDate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        print("[\(time)]: didFinishLaunchingWithOptions -> Application launched")
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("[\(time)] [Inactive]: applicationWillResignActive -> Приложение запущено и находится на переднем плане, но не обрабатывает события пользователя: касания, жесты и т.д.")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("[\(time)] [Active]: applicationDidBecomeActive -> Приложение находится на переднем плане и активно обрабатывает пользовательские действия: касания, жесты и т.д.")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("[\(time)] [Background]: applicationDidEnterBackground -> Приложение свёрнуто и не отображается на экране, но при этом всё ещё может выполнять ограниченные фоновые задачи.")
    }
}

