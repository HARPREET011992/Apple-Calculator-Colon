//
//  CalculatorButton.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-08.
//

import SwiftUI

enum CalculatorButton {
    case divide, multiply, subtract, plus, equal, reminder
    case zero, one, two, three, four, five, six, seven, eight, nine
    case ac, plusMinus, dot
    
    var title: String {
        switch self {
        case .ac: return "AC"
        case .divide: return "÷"
        case .multiply: return "X"
        case .subtract: return "-"
        case .plus: return "+"
        case .equal: return "="
        case .reminder: return "%"
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plusMinus: return "+/-"
        default: return "."
        }
    }
    
    var color: Color {
        switch self {
        case .ac,.plusMinus,.reminder:
            return Color(.lightGray)
        case .divide,.multiply,.subtract,.plus,.equal:
            return .orange
        default:
            return Color(.darkGray)
        }
    }
}
