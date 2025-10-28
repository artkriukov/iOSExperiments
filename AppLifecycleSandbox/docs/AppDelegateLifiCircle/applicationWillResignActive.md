# applicationWillResignActive

- **Когда вызывается**: приложение собирается перейти из активного состояния в неактивное: пользователь получил телефонный звонок или нажал Home.
- **Что делать**:
    - Приостановить текущие задачи: игровой цикл, воспроизведение видео, таймеры.
    - Отключить анимации.
- **iOS 13+**: для каждой сцены есть `sceneWillResignActive(_:)` в `SceneDelegate`, а `applicationWillResignActive(_:)` в `AppDelegate` отвечает только за глобальные события.
- **Документация**: [applicationWillResignActive](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationwillresignactive(_:)/).