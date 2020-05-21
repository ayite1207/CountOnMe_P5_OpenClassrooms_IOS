//
//  Calculation.swift
//  CountOnMe
//
//  Created by ayite  on 26/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

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
        return elements.count >= 3
    }
    // allows to know if the last element selected is an operator
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    // allows to know if the element = is in the textView
    var expressionHaveResult: Bool {
        return expression.firstIndex(of: "=") != nil
    }
    // allows to know if the textView is empty
    var expressionIsEmpty: Bool {
        return expression == ""
    }
<<<<<<< HEAD
    // lets know if the last calculation is divisoin by zero
   var divisionByZero: Bool {
    return expression.contains("/ 0")
    }
    /**
     calcul() pallows to make calculate
     
        - Parameter : result: the result to convert
     */
    func float(result: Float)-> Bool{
        var response: Bool
        let intResult = Int(result)
        if result == Float(intResult) {
            response = true
        } else {
            response = false
        }
        return response
    }

    /**
     result() allows to make calculate
     */
    func result(){
=======
    /**
     result() allows to calculate and return the result
     */
    func result()-> String{
>>>>>>> 8c58e29ac35996c2033efcab8921e142d62018c1
        // Create local copy of operations
        var operationsToReduce = elements
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
<<<<<<< HEAD
            let right = Float(operationsToReduce[2])!
            let result: Float
=======
            let right = Int(operationsToReduce[2])!
            let result: Int
>>>>>>> 8c58e29ac35996c2033efcab8921e142d62018c1
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            if float(result: result) == false{
                operationsToReduce.insert("\(result)", at: 0)
            }else {
                operationsToReduce.insert("\(Int(result))", at: 0)
            }
        }
        expression = operationsToReduce.joined(separator: " ")
    }
    /**
     calcul() pallows to make calculate
     
        - Parameters:
            - operatorCalcul: allows to make the operation
            - positionInArray: position of the operator
     */
    func calcul(operatorCalcul: String, positionInArray: Int){
        var operationsToReduce = elements
        let left = Float(elements[positionInArray - 1])!
        let right = Float(elements[positionInArray + 1])!
        var resultat: Float = 0
        switch operatorCalcul {
        case "+": resultat = left + right
        case "-": resultat = left - right
        case "x": resultat = left * right
        case "/": resultat = left / right
        default: fatalError("Unknown operator !")
        }
        for _ in 1...3 {
            operationsToReduce.remove(at: positionInArray - 1)
        }
        if float(result: resultat) == false{
            operationsToReduce.insert(String(resultat), at: positionInArray - 1)
        }else {
            operationsToReduce.insert(String(Int(resultat)), at: positionInArray - 1)
        }
        expression = operationsToReduce.joined(separator: " ")
    }
    /**
     priority0f0perations() prioritize operations if necessary
     */
    func priority0f0perations()-> String{
        let operation: String = expression
        while (elements.firstIndex(of: "x") != nil) && (elements.firstIndex(of: "/") != nil){
            if let multiplication = elements.firstIndex(of: "x"), let division = elements.firstIndex(of: "/") {
                if multiplication < division {
                    calcul(operatorCalcul: "x", positionInArray: multiplication)
                } else if multiplication > division {
                    calcul(operatorCalcul: "/", positionInArray: division)
                }
            }
        }
        while (elements.firstIndex(of: "x") != nil) && (elements.firstIndex(of: "/") == nil){
            if let multiplication = elements.firstIndex(of: "x"){
                calcul(operatorCalcul: "x", positionInArray: multiplication)
            }
        }
        while (elements.firstIndex(of: "x") == nil) && (elements.firstIndex(of: "/") != nil){
            if let division = elements.firstIndex(of: "/"){
                calcul(operatorCalcul: "/", positionInArray: division)
            }
        }
<<<<<<< HEAD
        result()
        let finalResult = "\(operation) = \(expression)"
        expression = finalResult
        return finalResult
=======
        
       expression = "\(resultat) = \(operationsToReduce.first!)"
        return expression
>>>>>>> 8c58e29ac35996c2033efcab8921e142d62018c1
    }
}
