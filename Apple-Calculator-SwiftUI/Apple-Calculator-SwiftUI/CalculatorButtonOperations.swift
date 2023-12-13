//
//  CalculatorButtonOperations.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-08.
//

import Foundation

class CalculatorButtonOperations : ObservableObject {
    
    @Published var displayNumber = 0 
    @Published var lastResult = 0
    @Published var currentOperation: Operation = .none
    @Published var awaitingNewNumberInput = true
    
    func didTap(button: CalculatorButton) {
           
           switch button {
           case .plus:
               setCurrentResult()
               currentOperation = .add
               awaitingNewNumberInput = true

           case .subtract:
               setCurrentResult()
               currentOperation = .subtract
               awaitingNewNumberInput = true

           case .multiply:
               setCurrentResult()
               currentOperation = .multiply
               awaitingNewNumberInput = true

           case .divide:
               setCurrentResult()
               currentOperation = .divide
               awaitingNewNumberInput = true

           case .equal:
               setCurrentResult()
               currentOperation = .none
               awaitingNewNumberInput = true

           case .ac:
               // set ALL to 0
               displayNumber = 0
               lastResult = 0
               currentOperation = .none
               awaitingNewNumberInput = true
               
           case .reminder:
               setCurrentResult()
               currentOperation = .reminder
               awaitingNewNumberInput = true

           case .dot, .plusMinus:
               break
               
           default:
               // number input
               let number = Int(button.title) ?? 0 // string to Int
               if awaitingNewNumberInput {
                   awaitingNewNumberInput = false
                   displayNumber = number
               } else {
                   displayNumber = displayNumber * 10 + number
               }
           }
       }
       
       
       // check if an older operation is active, calculate partial result
       func setCurrentResult() {
           switch currentOperation {
           case .add:
               displayNumber += lastResult
           case .subtract:
               displayNumber = lastResult - displayNumber
           case .multiply:
               displayNumber *= lastResult
           case .divide:
               displayNumber = lastResult / displayNumber
           case .reminder:
               displayNumber = lastResult % displayNumber
           case .none:
               break
           }
           lastResult = displayNumber
           currentOperation = .none
       }

}
