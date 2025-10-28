# Жизненный цикл SceneDelegate
С появлением поддержки нескольких окон в iOS 13 был введен SceneDelegate для управления жизненным циклом отдельных сцен (окон) приложения.

---
### **Методы жизненного цикла SceneDelegate**

1. `func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)`
    - **Описание**: Вызывается при создании сцены.
    - **Использование**: Настройка UIWindow и установка корневого ViewController.
2. `func sceneWillEnterForeground(_ scene: UIScene)`
    - **Описание**: Сцена переходит из фона в передний план.
    - **Использование**: Отмена изменений, сделанных при входе в фон.
3. `func sceneDidBecomeActive(_ scene: UIScene)`
    - **Описание**: Сцена стала активной.
    - **Использование**: Перезапуск задач, приостановленных при неактивности.
4. `func sceneWillResignActive(_ scene: UIScene)`
    - **Описание**: Сцена собирается перейти в неактивное состояние.
    - **Использование**: Приостановка текущих задач.
5. `func sceneDidEnterBackground(_ scene: UIScene)`
    - **Описание**: Сцена перешла в фоновый режим.
    - **Использование**: Сохранение данных, освобождение ресурсов.
6. `func sceneDidDisconnect(_ scene: UIScene)`
    - **Описание**: Сцена отключена системой.
    - **Использование**: Освобождение ресурсов, связанных с этой сценой.