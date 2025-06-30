//
//  ViewController.swift
//  calculator2
//
//  Created by Grant David Hughes on 6/30/25.
//

import UIKit

class ViewController: UIViewController {
    var currentDigit: Int = 0
    var previousDigit: Int = 0
    var currentOperation: String?
    var EnteringNumber: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var display: UILabel!
    
    @IBAction func digitUsed(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        if EnteringNumber {
            if display.text == "0" {
                display.text = digit
            }
            else {
                display.text! += digit
            }
        } else {
            display.text = digit
            EnteringNumber = true
        }
        currentDigit = Int(display.text!) ?? 0
    }
    @IBAction func OperationUsed(_ sender: UIButton) {
        guard let operations = sender.currentTitle else { return }
        
        if !EnteringNumber && operations == "-" && display.text! == "0" {
            display.text = "-"
            EnteringNumber = true
            return
        }
        
        previousDigit = currentDigit
        currentOperation = operations
        EnteringNumber = false
    }
    @IBAction func enterClicked(_ sender: UIButton) {
        guard let operation = currentOperation else { return }
        let result: Int
        switch operation {
        case "+":
            result = previousDigit + currentDigit
        case "-":
            result = previousDigit - currentDigit
        case "X":
            result = previousDigit * currentDigit
        case "/":
            guard currentDigit != 0 else {
                display.text = "Error"
                EnteringNumber = false
                return
            }
            result = previousDigit / currentDigit
        default:
            return
        }
        display.text = "\(result)"
        display.setNeedsLayout()
        display.layoutIfNeeded()
        currentDigit = result
        EnteringNumber = false
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        currentDigit = 0
        previousDigit = 0
        currentOperation = nil
        display.text = "0"
        EnteringNumber = false
    }
}

