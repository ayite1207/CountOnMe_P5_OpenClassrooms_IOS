//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
//    @IBOutlet var numberButtons: [UIButton]!
    var calculation = Calculation()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    calculation.expression = textView.text
        // Do any additional setup after loading the view.
    }
    /**
     alertVC() allows to display a message when the expression is not correct
     */
    fileprivate func alertVC() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }
    /**
     restartOperation() erased the string of the textView and the expression

     */
    fileprivate func restartOperation() {
        textView.text = ""
        calculation.expression = ""
    }
    /**
     tappedNumberButton() allows to display a number in the textView and initializes the variable expression
     
     - Parameters:
        - sender : represents the button of a number the user pressed
     */
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        if calculation.expressionHaveResult {
            restartOperation()
        }
        textView.text.append(numberText)
        calculation.expression.append(contentsOf: numberText)
    }
    /**
     tappedOperatorButton() allows to display an operator in the textView and initializes the variable expression
     
     - Parameters:
        - sender : represents the button of a operator the user pressed
     */
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operatorButton = sender.titleLabel?.text! else { return}
        if calculation.expressionHaveResult {
            restartOperation()
        }
        
        if calculation.expressionIsEmpty {
            return alertVC()
        }
        
        if calculation.canAddOperator {
            textView.text.append(" \(operatorButton) ")
            calculation.expression = textView.text
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    /**
     tappedEqualButton() allows to display the result in the textView
     
     - Parameters:
        - sender : represents the button equal the user pressed
     */
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        if calculation.expressionHaveResult {
            restartOperation()
        }
        
        guard calculation.expressionIsCorrect else {
            return alertVC()
        }
        
        guard calculation.expressionHaveEnoughElement else {
            return alertVC()
        }
        textView.text = calculation.result()
    }
    /**
     tappedCancelButton() erases the string of the textView and the expression
     
     - Parameters:
        - sender : represents the button equal the user pressed
     */
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        restartOperation()
    }
    
}

