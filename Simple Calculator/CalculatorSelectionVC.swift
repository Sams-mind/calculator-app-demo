//
//  CalculatorSelectionVC.swift
//  Simple Calculator
//
//  Created by Samandar on 24/10/24.
//


import UIKit

class CalculatorSelectionVC: UIViewController {
    
    // Define variables for calculations
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var performingMath = false
    var displayLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Set up display label
        displayLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 100)
        displayLabel.backgroundColor = .black
        displayLabel.textColor = .white
        displayLabel.font = UIFont.systemFont(ofSize: 40)
        displayLabel.textAlignment = .right
        displayLabel.text = "0"
        view.addSubview(displayLabel)

        // Set up number and operator buttons
        let buttonTitles = [
            ["7", "8", "9", "/"],
            ["4", "5", "6", "*"],
            ["1", "2", "3", "-"],
            ["0", "C", "=", "+"]
        ]

        let buttonWidth = view.frame.width / 4
        let buttonHeight: CGFloat = 100

        for (row, buttonRow) in buttonTitles.enumerated() {
            for (col, buttonTitle) in buttonRow.enumerated() {
                let button = UIButton(type: .system)
                button.frame = CGRect(
                    x: CGFloat(col) * buttonWidth,
                    y: CGFloat(row) * buttonHeight + 220,
                    width: buttonWidth,
                    height: buttonHeight
                )
                button.setTitle(buttonTitle, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 32)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .darkGray
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.black.cgColor
                button.tag = row * 4 + col  // Tag buttons to differentiate

                // Add target action for button press
                button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)

                view.addSubview(button)
            }
        }
    }

    @objc func buttonPressed(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!

        if let number = Int(buttonTitle) {
            // Handle number button press
            if performingMath {
                displayLabel.text = "\(number)"
                performingMath = false
            } else {
                if displayLabel.text == "0" || displayLabel.text == "+" || displayLabel.text == "-" || displayLabel.text == "*" || displayLabel.text == "/" {
                    displayLabel.text = "\(number)"
                } else {
                    displayLabel.text! += "\(number)"
                }
            }
            currentNumber = Double(displayLabel.text!)!
        } else if buttonTitle == "C" {
            // Clear button pressed
            displayLabel.text = "0"
            currentNumber = 0
            previousNumber = 0
            operation = 0
            performingMath = false
        } else if buttonTitle == "=" {
            // Equals button pressed
            var result: Double = 0
            if operation == 1 { result = previousNumber + currentNumber }
            else if operation == 2 { result = previousNumber - currentNumber }
            else if operation == 3 { result = previousNumber * currentNumber }
            else if operation == 4 { result = previousNumber / currentNumber }

            displayLabel.text = "\(result)"
            currentNumber = result
            performingMath = false
        } else {
            // Operator button pressed (+, -, *, /)
            previousNumber = currentNumber
            if buttonTitle == "+" { operation = 1 }
            else if buttonTitle == "-" { operation = 2 }
            else if buttonTitle == "*" { operation = 3 }
            else if buttonTitle == "/" { operation = 4 }

            performingMath = true
            displayLabel.text = buttonTitle
        }
    }
}

