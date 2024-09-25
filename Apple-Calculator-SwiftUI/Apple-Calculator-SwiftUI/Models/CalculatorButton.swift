//
//  CalculatorButton.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-08.
//

import SwiftUI

enum CalculatorButton: CaseIterable, Identifiable {
    case divide, multiply, subtract, plus, equal, reminder
    case zero, one, two, three, four, five, six, seven, eight, nine
    case ac, plusMinus, dot

    // Provide a unique ID for each case using the hash value
    var id: String {
        switch self {
        case .divide: return "divide"
        case .multiply: return "multiply"
        case .subtract: return "subtract"
        case .plus: return "plus"
        case .equal: return "equal"
        case .reminder: return "reminder"
        case .zero: return "zero"
        case .one: return "one"
        case .two: return "two"
        case .three: return "three"
        case .four: return "four"
        case .five: return "five"
        case .six: return "six"
        case .seven: return "seven"
        case .eight: return "eight"
        case .nine: return "nine"
        case .ac: return "ac"
        case .plusMinus: return "plusMinus"
        case .dot: return "dot"
        }
    }

    var title: String {
        switch self {
        case .ac: return "AC"
        case .divide: return "÷"
        case .multiply: return "×"  // Use the multiplication symbol
        case .subtract: return "−"   // Use the minus symbol
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
        case .dot: return "."
        }
    }
    
    var color: Color {
        switch self {
        case .ac, .plusMinus, .reminder:
            return Color(.lightGray)
        case .divide, .multiply, .subtract, .plus, .equal:
            return .orange
        default:
            return Color(.darkGray)
        }
    }
}
