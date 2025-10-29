# Responder Chain
Responder Chain и обработка касаний в UIKit - это механизм определения, какое именно view должно обработать событие касания. При нажатии на экран система использует два ключевых метода: [hitTest(_:with:)](/UIKit/docs/HitTest/HitTest.md) для поиска целевого view сверху вниз по иерархии, и [point(inside:with:)](/UIKit/docs/Point%20Inside/pointInside.md) для проверки попадания точки в границы view.

---
Responder Chain - это цепочка объектов-респондеров - UIResponder, через которую система передаёт события: touches, motion, remote control, editing menu от первого получателя до объекта, способного их обработать. Если текущий респондер не может обработать событие, оно автоматически передаётся следующему респондеру в цепи.

### Порядок в Responder Chain

```md
Touch Event → Hit-Test Winner (First Responder)
                ↓ (если не обработал)
            Parent View
                ↓
        Parent View Controller
                ↓
            Window
                ↓
           UIApplication
                ↓
        App Delegate (если UIResponder)
```

### Два этапа обработки касаний

1. Hit-Testing (определение получателя):
    - Происходит ДО responder chain
    - Определяет, какое view должно первым получить событие
    - Использует hitTest(_:with:) и point(inside:with:)

2. Event Delivery (передача по цепи):
    - Начинается с hit-test winner
    - Если view не обрабатывает → передаёт next responder
    - Продолжается до обработки или конца цепи

### Практический пример

```swift
class CustomButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Опция 1: Обработать и остановить
        print("Button handled touch")
        // Не вызываем super → событие НЕ идёт дальше
        
        // Опция 2: Обработать и передать дальше
        print("Button processing touch")
        super.touchesBegan(touches, with: event)
        // Вызов super → событие идёт к next responder
    }
}

// Пример с UITextField
class CustomViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Типичный use case - скрыть клавиатуру
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
```

### Target-Action vs Responder Chain

```swift
// Target-Action (прямая связь)
button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
// Событие идёт напрямую к target

// Responder Chain (автоматический поиск)
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    // Событие идёт по цепи пока не найдёт обработчик
}
```

### UIControl и Responder Chain

```swift
// UIControl прерывает стандартную цепь
class UIButton: UIControl {
    // UIControl перехватывает touches методы
    // Конвертирует их в Control Events (.touchUpInside и т.д.)
    // Отправляет через target-action, а НЕ responder chain
}

// Поэтому для UIButton:
override func touchesBegan(...) // Обычно НЕ вызывается
// Вместо этого используйте:
addTarget(self, action: #selector(handleTap), for: .touchUpInside)
```

### First Responder и UITextField

```swift
// First Responder - объект, первым получающий события клавиатуры
textField.becomeFirstResponder() // Показать клавиатуру
textField.resignFirstResponder() // Скрыть клавиатуру

// Responder chain для keyboard events:
// UITextField → UIView → UIViewController → UIWindow → UIApplication
```