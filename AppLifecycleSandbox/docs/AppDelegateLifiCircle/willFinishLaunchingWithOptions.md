# willFinishLaunchingWithOptions

- **Когда вызывается**: сразу после того, как система инициализировала приложение, но перед тем, как полностью завершить процесс запуска.
- **Что делать**: выполнять минимальную инициализацию: настройки логирования, начальные конфигурации, чтобы ускорить появление UI.
- **iOS 13+**: если используются сцены, этот метод всё ещё вызывается в `AppDelegate` — для глобальной инициализации, но создание **window** и первичного контроллера — в `SceneDelegate` (см. ниже).
- **Документация**: [willFinishLaunchingWithOptions](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/application(_:willfinishlaunchingwithoptions:)/).