//
//  TappedLabel.swift
//  ClickProcessing
//
//  Created by Artem Kriukov on 30.10.2025.
//

import UIKit

final class TappableView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
}
