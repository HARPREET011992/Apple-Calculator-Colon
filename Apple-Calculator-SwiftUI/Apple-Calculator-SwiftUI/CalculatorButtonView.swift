//
//  CalculatorButtonView.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-08.
//

import SwiftUI

struct ButtonView: View {
    var calculatorButton :CalculatorButton
    var body: some View {
        Text(calculatorButton.title)
            .font(.system(size: 32))
            .frame(width:self.buttonWidth(button: calculatorButton),height: self.buttonHeight())
            .background(calculatorButton.color)
            .foregroundStyle(.white)
            .cornerRadius(buttonWidth(button: calculatorButton))
    }
    
    func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}
