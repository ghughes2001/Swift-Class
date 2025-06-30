//
//  ViewController.swift
//  calculator2
//
//  Created by Grant David Hughes on 6/30/25.
//

import UIKit

enum calculator2Error: Error {
    case invalidExpression
    case divisionByZero
}

class ViewController: UIViewController {
    var expression: String = ""
    var evaluated = false
    var enteringNumber = false

    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
    }
    
    func operatorPriority(_ op: Character) -> Int {
        switch op {
        case "+", "-":
            return 1
        case "*", "/":
            return 2
        default:
            return 0
        }
    }
    func applyingOperator(_ a: Int, _ b: Int, _ op: Character) throws -> Int {
        switch op {
        case "+":
            return a + b
        case "-":
            return a - b
        case "*":
            return a * b
        case "/":
            if b == 0 { throw calculator2Error.divisionByZero }
            return a / b
        default:
            throw calculator2Error.invalidExpression
        }
    }
    func evaluate(_ expr: String) throws -> Int {
        var values = [Int]()
        var operators: [Character] = []
        let characters = Array(expr)
        var index = 0;
        
        while index < characters.count {
            let c = characters[index]
            if c.isWhitespace {
                index += 1
                continue
            }
            if c.isNumber {
                var val = 0
                while index < characters.count && characters[index].isNumber {
                    val = val * 10 + characters[index].wholeNumberValue!
                    index += 1
                }
                values.append(val)
                continue
            }
            if "+-*/".contains(c) {
                while let last = operators.last, operatorPriority(last) >= operatorPriority(c) {
                    guard values.count >= 2 else { throw calculator2Error.invalidExpression }
                    let b = values.removeLast()
                    let a = values.removeLast()
                    let op = operators.removeLast()
                    let result = try applyingOperator(a, b, op)
                    values.append(result)
                }
                operators.append(c)
            } else {
                throw calculator2Error.invalidExpression
            }
            index += 1
        }
        while !operators.isEmpty {
            guard values.count >= 2 else { throw calculator2Error.invalidExpression }
            let b = values.removeLast()
            let a = values.removeLast()
            let op = operators.removeLast()
            let result = try applyingOperator(a, b, op)
            values.append(result)
        }
        guard values.count == 1 else { throw calculator2Error.invalidExpression }
        return values[0]
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
        do {
            let result = try evaluate(expression)
            display.text = "\(result)"
            expression = "\(result)"
            evaluated = true
        } catch calculator2Error.divisionByZero {
            display.text = "Error"
            expression = ""
            evaluated = false
        } catch {
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

