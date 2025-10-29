# applicationDidEnterBackground

- **Когда вызывается**: приложение полностью уходит в фон, после перехода в неактивное состояние.
- **Что делать**:
    - Освободить ресурсы: закрыть сессии работы с сетью, сохранить данные в базу или файл.
    - Запустить фоновые задачи: сохранение состояния, завершение загрузок.
- **iOS 13+**: похожий метод `sceneDidEnterBackground(_:)` находится в `SceneDelegate` и отвечает за фоновые задачи конкретной сцены; глобальная логика, глобальное сохранение, остаётся в `applicationDidEnterBackground(_:)`.
- **Документация**: [applicationDidEnterBackground](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/applicationdidenterbackground(_:)/).