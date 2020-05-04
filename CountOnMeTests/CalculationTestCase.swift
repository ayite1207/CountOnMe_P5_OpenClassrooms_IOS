//
//  CalculationTestCase.swift
//  CountOnMeTests
//
//  Created by ayite  on 29/04/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculationTestCase: XCTestCase {
    var calculation:  Calculation!
        
    override func setUp() {
        super.setUp()
        calculation = Calculation()
    }
        func testGivenExpressionHaveValue_WhenITappeOnAButton_ThenVariableExpressionHaveResultShoukdBeTrue(){

//          when ExpressionHaveValue
            calculation.expression = "2+24="
            
//          then variableExpressionHaveResultShoukdBeTrue
            XCTAssertTrue(calculation.expressionHaveResult)
        }
        func testGivenAddOperator_WhenITappeOnANumber_ThenVariableCanAddOperatorShoukdBeTrue(){

//          when ExpressionHaveValue
            calculation.expression = "2"
            
//          then variableCanAddOperatorShoukdBeTrue
            XCTAssertTrue(calculation.canAddOperator)
        }
    func testGivenAddOperator_WhenITappeOnEqual_ThenVariableExpressionHaveEnoughElementShouldBeTrue(){

    //          when ExpressionHaveValue
                calculation.expression = "2 + 2"
        
    //          then variableCanAddOperatorShoukdBeTrue
                XCTAssertTrue(calculation.expressionHaveEnoughElement)
            }
    
    func testGivenAddOperator_WhenITappeOnEqual_ThenFunctionresultShouldReturnTheResult(){

    //          when ExpressionHaveValue
                calculation.expression = "2 + 5"
        
    //          then variableCanAddOperatorShoukdBeTrue
                XCTAssert(calculation.result() == "2 + 5 = 7")
            }
    
}
