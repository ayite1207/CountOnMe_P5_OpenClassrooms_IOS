//
//  Calculation.swift
//  CountOnMe
//
//  Created by ayite  on 26/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

class Calculation {
    
    var expression: String = ""
    
    var elements: [String] {
        return expression.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    // check if there are enough elements to make an operation
    var expressionHaveEnoughElement: Bool {
        print("il y a \(elements.count) elements")
        return elements.count >= 3
    }
    // allows to know if the last element selected is an operator
    var canAddOperator: Bool {
        if let operato = elements.last {
            print(operato)
        }
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    // allows to know if the element = is in the textView
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    
    func result()-> String{
        // Create local copy of operations
        var operationsToReduce = elements
        let resultat: String = expression
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            print("left = \(left) operand = \(operand) right = \(right)")
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
       expression = "\(resultat) = \(operationsToReduce.first!)"
        print("operationsToReduce = \(operationsToReduce.first!)")
        print("\(resultat) = \(operationsToReduce.first!)")
        return "\(resultat) = \(operationsToReduce.first!)"
    }
}
