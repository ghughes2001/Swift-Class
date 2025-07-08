//
//  modle.swift
//  calculator2
//
//  Created by Grant David Hughes on 7/7/25.
//

import Foundation

enum calculator2Error: Error {
    case invalidExpression
    case divisionByZero
}

protocol calculator2ModelDelegate: AnyObject {
    func displayDidUpdate(_ text: String)
    func showError(_ text: String)
    
}

class calculator2ModelImpl {
    weak var delegate: calculator2ModelDelegate?
    
    var expression: String = ""
    var evaluated: Bool = false
    var enteringNumber: Bool = false
    var currentDisplay: String {
        return expression.isEmpty ? "0" : expression
    }
    
    func reset() {
        expression = ""
        evaluated = false
        enteringNumber = false
    }
    
    func clear() {
        reset()
        delegate?.displayDidUpdate("0")
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
    
    func digitUsed(_ digit: String) {
        if evaluated {
            expression = digit
            evaluated = false
        } else if enteringNumber {
            expression += digit
        } else {
            expression += digit
        }
        enteringNumber = true
        delegate?.displayDidUpdate(currentDisplay)
    }
    
    func OperationUsed(_ operation: String) {
        let operationToChar: Character
        switch operation {
        case "+":
            operationToChar = "+"
        case "-":
            operationToChar = "-"
        case "X":
            operationToChar = "*"
        case "/":
            operationToChar = "/"
        default :
            return
        }
        
        if evaluated {
            evaluated = false
        } else if !enteringNumber && expression.last.map({ "+-*/".contains($0) }) == true {
            expression.removeLast()
        }
        expression.append(operationToChar)
        enteringNumber = false
        delegate?.displayDidUpdate(currentDisplay)
    }
    
    func enter() {
        do {
            let result = try evaluate(expression)
            expression = "\(result)"
            evaluated = true
            enteringNumber = false
            delegate?.displayDidUpdate(expression)
        } catch calculator2Error.divisionByZero {
            delegate?.showError("Error: Division by 0")
            reset()
        } catch {
            delegate?.showError("Invalid Expression")
            reset()
        }
    }
}
