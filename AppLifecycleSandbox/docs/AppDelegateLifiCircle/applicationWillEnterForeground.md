# applicationWillEnterForeground

- **Когда вызывается**: приложение собирается перейти из фонового в неактивное состояние, до того, как оно станет активным.
- **Что делать**:
    - Подготовить UI: отменить изменения, сделанные при уходе в фон.
    - Проверить наличие новых данных, например, проверка сессии пользователя.
- **iOS 13+**: для каждой сцены есть `sceneWillEnterForeground(_:)` в `SceneDelegate`, а `applicationWillEnterForeground(_:)` остаётся для глобальной логики, к примеру, сброс глобальных фонових таймеров.
- **Документация**: [applicationWillEnterForeground](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/applicationwillenterforeground(_:)/).