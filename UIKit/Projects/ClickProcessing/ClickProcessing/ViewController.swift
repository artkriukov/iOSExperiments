//
//  ViewController.swift
//  ClickProcessing
//
//  Created by Artem Kriukov on 29.10.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    let view1 = TappableView()
    let view2 = TappableView()
    let view3 = TappableView()
    let view4 = TappableView()
    let view5 = TappableView()
    
    private lazy var label: UILabel = {
        let element = UILabel()
        element.text = "Hello"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupsConstraints()
    }

    @objc func view1Touched(tapGestureRecognizer: UITapGestureRecognizer) {
        label.text = "blue"
        print("blue")
    }
    
    @objc func view2Touched(tapGestureRecognizer: UITapGestureRecognizer) {
        label.text = "green"
        print("green")
    }
    
    @objc func view3Touched(tapGestureRecognizer: UITapGestureRecognizer) {
        label.text = "brown"
        print("brown")
    }
    
    @objc func view4Touched(tapGestureRecognizer: UITapGestureRecognizer) {
        label.text = "orange"
        print("orange")
    }
    
    @objc func view5Touched(tapGestureRecognizer: UITapGestureRecognizer) {
        label.text = "cyan"
        print("cyan")
    }
}

extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemGray
        view1.backgroundColor = .blue
        view2.backgroundColor = .green
        view3.backgroundColor = .brown
        view4.backgroundColor = .orange
        view5.backgroundColor = .cyan
        
        view.addSubview(label)
        
        view.addSubview(view1)
        view1.addSubview(view2)
        view2.addSubview(view3)
        
        view.addSubview(view4)
        view4.addSubview(view5)
        
        [view1, view2, view3, view4, view5].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 8
            view.layer.opacity = 0.7
        }

        view1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(view1Touched(tapGestureRecognizer:))))
        view2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(view2Touched(tapGestureRecognizer:))))
        view3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(view3Touched(tapGestureRecognizer:))))
        view4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(view4Touched(tapGestureRecognizer:))))
        view5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(view5Touched(tapGestureRecognizer:))))
    }
    
    func setupsConstraints() {
        
        NSLayoutConstraint.activate([
            
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            view1.heightAnchor.constraint(equalToConstant: 300),
            
            view2.topAnchor.constraint(equalTo: view1.topAnchor, constant: 10),
            view2.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 36),
            view2.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: -16),
            view2.heightAnchor.constraint(equalToConstant: 100),
            
            view3.topAnchor.constraint(equalTo: view2.topAnchor, constant: 5),
            view3.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 75),
            view3.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: -5),
            view3.heightAnchor.constraint(equalToConstant: 250),
            
            view4.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20),
            view4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            view4.heightAnchor.constraint(equalToConstant: 300),

            view5.topAnchor.constraint(equalTo: view4.topAnchor, constant: 10),
            view5.leadingAnchor.constraint(equalTo: view4.leadingAnchor, constant: 10),
            view5.trailingAnchor.constraint(equalTo: view4.trailingAnchor, constant: -10),
            view5.heightAnchor.constraint(equalToConstant: 200),
            
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
        ])
    }
}

// 1  На экране есть три прямоугольника разных цветов — красный, зеленый и синий — они частично перекрываются.
//Пользователь нажимает на экран в любой точке, включая области этих прямоугольников.
//При нажатии происходит последовательный вызов методов:
//Сначала вызывается метод hitTest(_:with:) у корневого view, который рекурсивно проверяет, какой дочерний view должен обработать касание.
//Внутри hitTest вызывается point(inside:with:) для каждого view, чтобы проверить, находится ли точка касания внутри его границ.
//Как только метод hitTest найден у конкретного view, он становится тем, кто получит событие касания.
//События касания (touchesBegan, touchesMoved, touchesEnded) передаются этому view и проходят по цепочке респондеров, если тот не обработал событие полностью.
//Внизу экрана в текстовом поле появляется лог с координатой касания и названием вызванных методов: например, какая view обработала hitTest, сработал ли point(inside:with:), и принимает ли view событие touchesBegan.
//Если нажать на перекрывающиеся области, можно увидеть, как именно выбирается верхний view, или если pointInside возвращает false, как событие передается другому view.

//Что именно в лог выводится

//Координата точки касания (например, x=150, y=200).
//Результат вызова hitTest и pointInside с именем view (например, hitTest in RedView, pointInside in GreenView = false).
//Собственно событие касания (например, touchesBegan в RedView).
//Может быть цепочка событий в responder chain (если делаете вывод touchesSuper в superview).


// 2 Расширить область нажатия кнопки
