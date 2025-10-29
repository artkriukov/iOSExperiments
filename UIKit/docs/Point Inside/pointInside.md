# Point Inside
`point(inside:with:)` - это метод UIView, который определяет, находится ли точка касания внутри границ, bounds, данного view. Возвращает true если точка внутри bounds, false если снаружи. Это ключевой компонент системы hit-testing в UIKit.

### Сигнатура метода

```swift
func point(inside point: CGPoint, with event: UIEvent?) -> Bool
```

**Параметры**
- point - точка в системе координат текущего view
- event - событие, которое вызвало проверку. Может быть nil при программной проверке.

### Как это работает

```swift
// Стандартная реализация (упрощённо)
func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    return bounds.contains(point)
}

// По факту проверяет:
// point.x >= 0 && point.x <= bounds.width &&
// point.y >= 0 && point.y <= bounds.height
```

### Роль в Hit-Testing

```swift
// point(inside:with:) вызывается внутри hitTest
override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    // Сначала проверяем базовые условия
    guard isUserInteractionEnabled, !isHidden, alpha > 0.01 else {
        return nil
    }
    
    // Вызываем point(inside:with:) ← ЗДЕСЬ!
    guard self.point(inside: point, with: event) else {
        return nil // Точка вне bounds - не проверяем subviews
    }
    
    // Только если точка внутри - проверяем детей
    for subview in subviews.reversed() {
        // ...
    }
    
    return self
}
```

### Отличие от hitTest

|                         | point(inside:with:)                  | hitTest(_:with:)                           |
|-------------------------|--------------------------------------|--------------------------------------------|
| Что проверяет           | Только текущий view                  | Всю иерархию (рекурсивно)                  |
| Возвращаемое значение   | Bool                              | UIView?                            |
| Проверка subviews       | Не проверяет subviews                  | Рекурсивно проверяет детей                     |
| Вызов                   | Вызывается из hitTest                   |    Сам вызывает point(inside:with:)            |
