//
//  ViewController.swift
//  Calculator
//
//  Created by Grant David Hughes on 6/24/25.
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
        
        displayLabel.frame = CGRect(x:20,y:100,width:300,height:60)
        
        displayLabel.alpha = 1.0
        displayLabel.isHidden = false
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func digitUsed(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        if EnteringNumber {
            if displayLabel.text == "0" {
                displayLabel.text = digit
            }
            else {
                displayLabel.text! += digit
            }
        } else {
            displayLabel.text = digit
            EnteringNumber = true
        }
        currentDigit = Int(displayLabel.text!) ?? 0
    }
    
    @IBAction func operationUsed(_ sender: UIButton) {
        guard let operations = sender.currentTitle else { return }
        
        if !EnteringNumber && operations == "-" && displayLabel.text! == "0" {
            displayLabel.text = "-"
            EnteringNumber = true
            return
        }
        
        previousDigit = currentDigit
        currentOperation = operations
        EnteringNumber = false
    }
    
    @IBAction func enterClick(_ sender: UIButton) {
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
                displayLabel.text = "Error"
                EnteringNumber = false
                return
            }
            result = previousDigit / currentDigit
        default:
            return
        }
        displayLabel.text = "\(result)"
        displayLabel.setNeedsLayout()
        displayLabel.layoutIfNeeded()
        currentDigit = result
        EnteringNumber = false
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        currentDigit = 0
        previousDigit = 0
        currentOperation = nil
        displayLabel.text = "0"
        EnteringNumber = false
    }
}

