//
//  ViewController.swift
//  calculator2
//
//  Created by Grant David Hughes on 6/30/25.
//

import UIKit

class ViewController: UIViewController {
    var expression: String = ""
    var evaluated = false
    var enteringNumber = false

    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
    }
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func digitUsed(_ sender: UIButton) {
        guard let digit = sender.configuration?.title else { return }
        
        if evaluated {
            display.text = digit
            expression = digit
            evaluated = false
        } else if enteringNumber {
            display.text! += digit
            expression += digit
        } else {
            display.text = digit
            expression += digit
        }
        enteringNumber = true
    }
    @IBAction func OperationUsed(_ sender: UIButton) {
        guard let operations = sender.configuration?.title  else { return }
        
        let operationToTString: String
        switch operations {
        case "+":
            operationToTString = "+"
        case "-":
            operationToTString = "-"
        case "X":
            operationToTString = "*"
        case "/":
            operationToTString = "/"
        default :
            return
        }
        
        if evaluated {
            evaluated = false
        } else if !enteringNumber && expression.last.map({ "+-*/".contains($0) }) == true {
            expression.removeLast()
        }
        expression += operationToTString
        enteringNumber = false
    }
    
    @IBAction func enterClicked(_ sender: UIButton) {
        let mathExp = NSExpression(format: expression)
        if let result = mathExp.expressionValue(with: nil, context: nil) as? NSNumber {
            let doubleResult = result.doubleValue
            
            if doubleResult.isInfinite || doubleResult.isNaN {
                display.text = "Error"
                expression = ""
            } else {
                display.text = "\(Int(doubleResult))"
                expression = "\(Int(doubleResult))"
            }
            evaluated = true
        } else {
            display.text = "Error"
            expression = ""
            evaluated = false
        }
        enteringNumber = false
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        expression = ""
        display.text = "0"
        enteringNumber = false
        evaluated = false
    }
}

