//
//  CurrentTime.swift
//  AppLifecycleSandbox
//
//  Created by Artem Kriukov on 28.10.2025.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
