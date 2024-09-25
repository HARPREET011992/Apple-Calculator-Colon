//
//  ContentView.swift
//  Apple-Calculator-SwiftUI
//
//  Created by Harpreet Kaur on 2023-12-07.
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CalculatorViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    let buttonRows: [[CalculatorButton]] = [
        [.ac, .plusMinus, .reminder, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equal]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(viewModel.displayNumber)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.system(size: 64))
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
            
            // Calculator buttons
            VStack(spacing: 12) {
                ForEach(buttonRows, id: \.self) { buttonRow in
                    HStack(spacing: 12) {
                        ForEach(buttonRow, id: \.self) { button in
                            ButtonView(calculatorButton: button)
                                .onTapGesture {
                                    viewModel.didTap(button: button)
                                }
                        }
                    }
                }
            }
            .padding(.bottom)
            
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    ContentView()
}


