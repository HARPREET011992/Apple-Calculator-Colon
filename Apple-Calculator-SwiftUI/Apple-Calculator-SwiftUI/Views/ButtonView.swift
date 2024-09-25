//
//  CalculatorButtonView.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-08.
//

import SwiftUI

struct ButtonView: View {
    let calculatorButton: CalculatorButton
    @Environment(\.colorScheme) var colorScheme  // Detect current color scheme

    var body: some View {
        Text(calculatorButton.title)
            .font(.system(size: 32))
            .frame(width: buttonWidth(), height: buttonHeight())
            .background(colorScheme == .dark ? Color.gray : calculatorButton.color)  // Dark mode adaptation
            .foregroundColor(colorScheme == .dark ? .white : .black)  // Adapt text color
            .cornerRadius(buttonWidth() / 2)
    }

    private func buttonWidth() -> CGFloat {
        return calculatorButton == .zero ? 160 : 80
    }

    private func buttonHeight() -> CGFloat {
        return 80
    }
}
