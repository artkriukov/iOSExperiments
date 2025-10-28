# Описание жизненного цикла AppDelegate
AppDelegate отвечает за обработку событий на уровне всего приложения, таких как запуск, завершение и получение уведомлений.

---
> Начиная с iOS 13, функции управления жизненным циклом интерфейса: создание window, переходы между активным и фоновой стадиями и т. д. по умолчанию выполняются в SceneDelegate, а не в AppDelegate. Поэтому, если в проекте настроены сцены, через ключ UIApplicationSceneManifest в Info.plist, аналогичные методы будут вызываться в SceneDelegate вместо AppDelegate.

**Ниже показан актуальный порядок вызова методов для классического AppDelegate — до iOS 13 с пометкой, где они заменяются на SceneDelegate — iOS 13+.**

---
1. Запуск приложения
    1. [willFinishLaunchingWithOptions](willFinishLaunchingWithOptions.md)
    2. [didFinishLaunchingWithOptions](didFinishLaunchingWithOptions.md)
    3. [applicationDidBecomeActive](applicationDidBecomeActive.md)
2. Переход в фоновый режим
    1. [applicationWillResignActive](applicationWillResignActive.md)
    2. [applicationDidEnterBackground](applicationDidEnterBackground.md)
3. Возвращение на передний план
    1. [applicationWillEnterForeground](applicationWillEnterForeground.md)
    2. [applicationDidBecomeActive](applicationDidBecomeActive.md)
4. Завершение приложения
    1. [applicationWillTerminate](applicationWillTerminate.md)

---

### Замечание про SceneDelegate
`Info.plist`: при наличии ключа `UIApplicationSceneManifest `приложение использует жизненный цикл сцен. В этом случае создание `UIWindow`, управление переходами между состояниями интерфейса и другие методы, связанные с UI, переносятся в `SceneDelegate`

``` swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController(dataService: DataService())
        window?.makeKeyAndVisible()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Аналог applicationDidBecomeActive для конкретной сцены
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Аналог applicationWillResignActive
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Аналог applicationDidEnterBackground
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Аналог applicationWillEnterForeground
    }
    // … и т. д.
}
```