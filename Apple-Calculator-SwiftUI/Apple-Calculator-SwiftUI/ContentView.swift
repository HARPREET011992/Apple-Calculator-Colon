//
//  ContentView.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-07.
//

import SwiftUI

enum Operation {
    case add, subtract, multiply, divide, reminder, none
}

struct ContentView: View {
    @StateObject var calculatorOperations = CalculatorButtonOperations()
    
    var buttons : [[CalculatorButton]] = [
        [.ac, .plusMinus, .reminder, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    
    var body: some View {
        ZStack(alignment:.bottom) {
            Color.black.ignoresSafeArea()
            Spacer()
            VStack(spacing:12) {
                HStack {
                    Spacer()
                    Text("\(calculatorOperations.displayNumber)")
                        .foregroundStyle(.white)
                        .font(.system(size: 64))
                }
                .padding()
                ForEach(buttons,id: \.self) { row in
                    HStack {
                        ForEach(row,id: \.self) { button in
                            Button {
                                calculatorOperations.didTap(button: button)
                            }
                        label: {
                            ButtonView(calculatorButton: button)
                        }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


