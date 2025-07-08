//
//  ViewController.swift
//  calculator2
//
//  Created by Grant David Hughes on 6/30/25.
//

import UIKit

class ViewController: UIViewController, calculator2ModelDelegate {
    @IBOutlet weak var display: UILabel!
    
    var model = calculator2ModelImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        display.text = "0"
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        guard let digit = sender.configuration?.title else { return }
        model.digitUsed(digit)
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        guard let op = sender.configuration?.title else { return }
        model.OperationUsed(op)
    }
    
    @IBAction func enterPressed(_ sender: UIButton) {
        model.enter()
    }

    @IBAction func clearPressed(_ sender: UIButton) {
        model.clear()
    }
    
    func displayDidUpdate(_ text: String) {
        display.text = text
    }
    
    func showError(_ message: String) {
        display.text = message
    }
}

