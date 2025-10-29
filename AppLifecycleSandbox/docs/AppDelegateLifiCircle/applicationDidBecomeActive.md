# applicationDidBecomeActive

- **Когда вызывается**: приложение стало активным, в том числе после запуска или возвращения из фонового режима.
- **Что делать**:
    - Перезапуск приостановленных задач: анимации, таймеры.
    - Обновление UI: синхронизировать данные, проверить новую информацию.
- **iOS 13+**: если настроены сцены, аналогичный метод `sceneDidBecomeActive(_:)` вызывается в `SceneDelegate` для каждой сцены отдельно, а `applicationDidBecomeActive(_:)` остаётся для глобальных задач, например, подписка на пуш-уведомления.
- **Документация**: [applicationDidBecomeActive](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationdidbecomeactive(_:)/).