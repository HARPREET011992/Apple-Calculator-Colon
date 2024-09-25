//
//  CalculatorButtonOperations.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-08.
//

import SwiftUI

enum Operation {
    case add, subtract, multiply, divide, reminder, dot, none
}

class CalculatorViewModel: ObservableObject {
    @Published var displayNumber: String = "0"
    
    private var currentOperation: Operation = .none
    private var previousNumber: Double = 0
    private var currentNumber: Double = 0
    private var isNewNumber: Bool = true

    func didTap(button: CalculatorButton) {
        switch button {
        case .ac:
            clearAll()
        case .plus, .subtract, .multiply, .divide, .reminder:
            setOperation(button)
        case .equal:
            performOperation()
        case .dot:
            addDecimalPoint()
        case .plusMinus:
            toggleNegative()
        default:
            appendNumber(button)
        }
    }
    
    private func clearAll() {
        displayNumber = "0"
        currentOperation = .none
        previousNumber = 0
        currentNumber = 0
        isNewNumber = true
    }
    
    private func setOperation(_ button: CalculatorButton) {
        currentOperation = convertToOperation(button)
        previousNumber = Double(displayNumber) ?? 0
        isNewNumber = true
    }
    
    private func performOperation() {
        currentNumber = Double(displayNumber) ?? 0
        let result: String
        
        switch currentOperation {
        case .add:
            result = formatResult(previousNumber + currentNumber)
        case .subtract:
            result = formatResult(previousNumber - currentNumber)
        case .multiply:
            result = formatResult(previousNumber * currentNumber)
        case .divide:
            result = formatResult(previousNumber / currentNumber)
        case .reminder:
            result = formatResult(previousNumber.truncatingRemainder(dividingBy: currentNumber))
        default:
            result = String(currentNumber)
        }
        
        displayNumber = formatResult(Double(result) ?? 0)
        isNewNumber = true
        currentOperation = .none
    }
    
    private func appendNumber(_ button: CalculatorButton) {
        if isNewNumber {
            displayNumber = button.title
            isNewNumber = false
        } else {
            displayNumber += button.title
        }
    }
    
    private func addDecimalPoint() {
        // Prevent multiple dots and ensure proper formatting
        if isNewNumber {
            displayNumber = "0."
            isNewNumber = false
        } else if !displayNumber.contains(".") {
            displayNumber += "."
        }
    }

    private func toggleNegative() {
        if displayNumber != "0" {
            if displayNumber.contains("-") {
                displayNumber.removeFirst()
            } else {
                displayNumber = "-\(displayNumber)"
            }
        }
    }
    
    private func formatResult(_ result: Double) -> String {
        // Format the result to two decimal places
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(result))  // Return an integer if the result is a whole number
        } else {
            return String(format: "%.2f", result)  // Return the result formatted to 2 decimal places
        }
    }
    
    private func convertToOperation(_ button: CalculatorButton) -> Operation {
        switch button {
        case .plus: return .add
        case .subtract: return .subtract
        case .multiply: return .multiply
        case .divide: return .divide
        case .reminder: return .reminder
        default: return .none
        }
    }
}
