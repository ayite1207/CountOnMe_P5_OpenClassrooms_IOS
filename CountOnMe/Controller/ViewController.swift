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
        // Do any additional setup after loading the view.
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        
       
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calculation.expression.append(contentsOf: numberText)
        print("expression AU DEBUT = \(calculation.expression)")
               print("tappedNumberButton")
        print(calculation.expressionHaveResult)
        if calculation.expressionHaveResult {
            print("expressionHaveResult = true")
            
            textView.text = ""
        }else{
            print("expressionHaveResult = false")
        }
        
        textView.text.append(numberText)
        
        print("expression A LA FIN = \(calculation.expression)")
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        print("operateur")
        guard let operatorButton = sender.titleLabel?.text! else { return}
        if calculation.canAddOperator {
            textView.text.append(" \(operatorButton) ")
            calculation.expression = textView.text
        } else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        print("equal")
        guard calculation.expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard calculation.expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        textView.text = calculation.result()
    }
}

