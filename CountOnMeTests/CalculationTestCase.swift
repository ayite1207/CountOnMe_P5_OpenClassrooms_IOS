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
    
// THE TEST RETURN TRUE
    
        func testGivenExpressionHasEqual_WhenITappeOnAButton_ThenVariableExpressionHaveResultShouldBeTrue(){

//          when ExpressionHaveValue
            calculation.expression = "2 + 24 = "
            
//          then variableExpressionHaveResultShoukdBeTrue
            XCTAssertTrue(calculation.expressionHaveResult)
        }
    
        func testGivenTheExpressionHasNoOperator_WhenITappeOnAOperator_ThenVariableCanAddOperatorShoukdBeTrue(){

//          when ExpressionHaveValue
            calculation.expression = "2"
            
//          then variableCanAddOperatorShoukdBeTrue
            XCTAssertTrue(calculation.canAddOperator)
        }
        func testGivenTheExpressionHasNoOperator_WhenITappeOnANumber_ThenVariableExpressionIsCorrectShoukdBeTrue(){

//          when ExpressionHaveValue
                calculation.expression = "2"
                
//          then variableCanAddOperatorShoukdBeTrue
                XCTAssertTrue(calculation.expressionIsCorrect)
        }
    func testGivenTheExprssionIsOK_WhenITappeOnEqual_ThenVariableExpressionHaveEnoughElementShouldBeTrue(){

    //          when ExpressionHaveValue
                calculation.expression = "2 + 2"
        
    //          then variableCanAddOperatorShoukdBeTrue
                XCTAssertTrue(calculation.expressionHaveEnoughElement)
            }
    
    func testGivenTheExprssionOK_WhenITappeOnEqual_ThenFunctionResultShouldReturnTheResult(){

    //          when ITappeOnEqual
                calculation.expression = "2 + 5"
        
    //          then ThenFunctionresultShouldReturnTheResult
                XCTAssert(calculation.result() == "2 + 5 = 7")
            }
    func testGivenTheExpressionIsEmpty_WhenITappeOnOperator_ThenVariableExpressionIsEmptyShouldBeTrue(){

    //          when ITappeOnEqual
                calculation.expression = ""
        
    //          then ThenVariableExpressionIsEmptyShouldBeTrue
                XCTAssertTrue(calculation.expressionIsEmpty)
            }
    
    // THE TEST RETURN FALSE
    
            func testGivenExpressionNoHaveEqual_WhenITappeOnAEqualButton_ThenVariableExpressionHaveResultShouldBeFalse(){

    //          when ExpressionHaveValue
                calculation.expression = "2 + 24"
                
    //          then variableExpressionHaveResultShoukdBeTrue
                XCTAssertFalse(calculation.expressionHaveResult)
            }
            func testGivenTheExpressionHasOperator_WhenITappeOnAOperator_ThenVariableCanAddOperatorShoukdBeFalse(){

    //          when ExpressionHaveValue
                calculation.expression = "2 +"
                
    //          then variableCanAddOperatorShoukdBeTrue
                XCTAssertFalse(calculation.canAddOperator)
            }
            func testGivenTheExpressionHasAnOperator_WhenITappeOnAEqualNumberr_ThenVariableExpressionIsCorrectShoukdBeFalse(){

    //          when ExpressionHaveValue
                    calculation.expression = "2 +"
                    
    //          then variableCanAddOperatorShoukdBeTrue
                    XCTAssertFalse(calculation.expressionIsCorrect)
            }
        func testGivenTheExpressionIsNotOK_WhenITappeOnEqual_ThenVariableExpressionHaveEnoughElementShouldBeFalse(){

        //          when ExpressionHaveValue
                    calculation.expression = "2 + "
            
        //          then variableCanAddOperatorShoukdBeTrue
                    XCTAssertFalse(calculation.expressionHaveEnoughElement)
                }
        
        func testGivenTheExprssionOK_WhenITappeOnEqual_ThenFunctionResultShouldReturnError(){

        //          when ITappeOnEqual
                    calculation.expression = "2 + 5"
            
        //          then ThenFunctionresultShouldReturnTheResult
                    XCTAssert(calculation.result() == "2 + 5 = 7")
                }
        func testGivenTheExpressionIsEmpty_WhenITappeOnOperator_ThenVariableExpressionIsEmptyShouldBeFalse(){

        //          when ITappeOnEqual
                    calculation.expression = "+"
            
        //          then ThenVariableExpressionIsEmptyShouldBeTrue
                    XCTAssertFalse(calculation.expressionIsEmpty)
                }
}
