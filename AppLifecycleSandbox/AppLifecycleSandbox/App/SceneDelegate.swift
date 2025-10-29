//
//  SceneDelegate.swift
//  AppLifecycleSandbox
//
//  Created by Artem Kriukov on 28.10.2025.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let time = Date().formattedDate()
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ViewController()
        self.window = window
        window.makeKeyAndVisible()
        print("[\(time)]: willConnectTo -> Настройка UIWindow и установка корневого ViewController. Вызывается при создании сцены")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("[\(time)]: sceneWillEnterForeground-> Отмена изменений, сделанных при входе в фон. Сцена переходит из фона в передний план.")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("[\(time)]: sceneDidBecomeActive -> Перезапуск задач, приостановленных при неактивности. Сцена стала активной.")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("[\(time)]: sceneWillResignActive -> Приостановка текущих задач. Сцена собирается перейти в неактивное состояние.")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("[\(time)]: sceneDidEnterBackground -> Сохранение данных, освобождение ресурсов. Сцена перешла в фоновый режим.")
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("[\(time)]: sceneWillResignActive -> Освобождение ресурсов, связанных с этой сценой. Сцена отключена системой.")
    }
}
