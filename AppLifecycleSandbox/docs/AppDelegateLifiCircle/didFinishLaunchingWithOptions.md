# didFinishLaunchingWithOptions

- **Когда вызывается**: сразу после `willFinishLaunchingWithOptions`, когда приложение полностью инициализировано, но еще не показано пользователю.
- **Что делать**:
    - Запуск сервисов: аналитика, базы данных, remote конфигурации.
    - Подготовка глобального состояния: настройка dependency injection, регистрация уведомлений.
    - **Для iOS 12 и ниже**: здесь обычно создается `UIWindow`, назначается `rootViewController` и делается `makeKeyAndVisible()`.
    - **iOS 13+ (при использовании сцен)**: в `AppDelegate` выполняются только глобальные задачи; саму настройку window и корневого контроллера делает метод `scene(_:willConnectTo:options:)` в `SceneDelegate`.
- **Документация**: [didFinishLaunchingWithOptions](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622921-application).