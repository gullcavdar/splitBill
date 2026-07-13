//
//  Color+Extension.swift
//  PawStock
//
//  Created by Gül Çavdar on 8.06.2026.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            red: Double((hex >> 16) & 0xFF)/255,
            green: Double((hex >> 8) & 0xFF)/255,
            blue: Double(hex & 0xFF)/255,
            opacity: alpha
        )
    }
}
