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
    
        func testGivenTheExpressionHasNoOperator_WhenITappeOnAOperator_ThenVariablesCanAddOperatorAndexpressionIsCorrectShoukdBeTrue(){

//          when ExpressionHaveValue
            calculation.expression = "2"
            
//          then variableCanAddOperatorShoukdBeTrue
            XCTAssertTrue(calculation.canAddOperator)
            XCTAssertTrue(calculation.expressionIsCorrect)
        }

    func testGivenTheExprssionHasAddition_WhenITappeOnEqual_ThenVariableExpressionHaveEnoughElementShouldReturnTheResult(){

    //          when ExpressionHaveValue
                calculation.expression = "2 + 2"
        
    //          then variableCanAddOperatorShoukdBeTrue
                XCTAssertTrue(calculation.expressionHaveEnoughElement)
                XCTAssert(calculation.priority0f0perations() == "2 + 2 = 4")
               
            }
    func testGivenTheExpressionHasAdditionAndSoustraction_WhenITappeOnEqual_ThenFunctionpriority0f0perationShouldReturnTheGoodResult(){

    //          when ITappeOnEqual
                calculation.expression = "5 + 5 - 2"
        
    //          then ThenFunctionresultShouldReturnTheResult
                XCTAssert(calculation.priority0f0perations() == "5 + 5 - 2 = 8")
            }
    func testGivenTheExpressionHasAdditionAndMultiplication_WhenITappeOnEqual_ThenFunctionpriority0f0perationShouldReturnTheGoodResult(){

    //          when ITappeOnEqual
                calculation.expression = "5 + 5 x 2"
        
    //          then ThenFunctionresultShouldReturnTheResult
                XCTAssert(calculation.priority0f0perations() == "5 + 5 x 2 = 15")
            }
    func testGivenTheExpressionHasAdditionAndDivision_WhenITappeOnEqual_ThenFunctionpriority0f0perationShouldReturnTheGoodResult(){

    //          when ITappeOnEqual
                calculation.expression = "5 + 10 / 2"
        
    //          then ThenFunctionresultShouldReturnTheResult
                XCTAssert(calculation.priority0f0perations() == "5 + 10 / 2 = 10")
            }
    func testGivenTheExpressionHasMultiplicationAndDivision_WhenITappeOnEqual_ThenFunctionpriority0f0perationShouldReturnTheGoodResult(){

    //          when ITappeOnEqual
                calculation.expression = "5 x 10 / 2"
        
    //          then ThenFunctionresultShouldReturnTheResult
                XCTAssert(calculation.priority0f0perations() == "5 x 10 / 2 = 25")
            }
    func testGivenTheExpressionHasDivisionAndMultiplication_WhenITappeOnEqual_ThenFunctionpriority0f0perationShouldReturnTheGoodResult(){

     //          when ITappeOnEqual
                 calculation.expression = "10 / 5 x 2"
         
     //          then ThenFunctionresultShouldReturnTheResult
                 XCTAssert(calculation.priority0f0perations() == "10 / 5 x 2 = 4")
             }
    func testGivenTheExpressionIsEmpty_WhenITappeOnOperator_ThenVariableExpressionIsEmptyShouldBeTrue(){

    //          when ITappeOnEqual
                calculation.expression = ""
        
    //          then ThenVariableExpressionIsEmptyShouldBeTrue
                XCTAssertTrue(calculation.expressionIsEmpty)
            }
    func testGivenTheExpressionHasADivisionByZero_WhenITappeOnEqual_ThenVariableExpressionIsEmptyShouldBeTrue(){

    //          when ITappeOnEqual
                calculation.expression = "8 / 0"
        
    //          then ThenVariableExpressiondivisionByZero
                XCTAssertTrue(calculation.divisionByZero)
            }
    
    func testGivenTheResultIs_WhenITappeOnEqual_ThenfunctionShouldReturnTrue(){

                XCTAssertTrue(calculation.float(result: 3.0))
            }
    func testGivenTheResultHasDecimal_WhenITappeOnEqual_ThenfunctionShouldReturnFalse(){

                XCTAssertFalse(calculation.float(result: 3.3))
            }
    func testGivenTheExpressionHasAnAddition_WhenITappeOnEqual_ThenVariableExpressionShouldBe11(){

       //          when ITappeOnEqual
                   calculation.expression = "8 + 3"
                    calculation.result()
       //          then ThenVariableExpressionShouldBe11
        XCTAssert(calculation.expression == "11")
               }
    func testGivenTheExpressionHasAdditionAndDivision_WhenITappeOnEqual_ThenVariableExpressionShould12(){

    //          when ITappeOnEqual
                calculation.expression = "8 x 3 / 2"
                 calculation.result()
    //          then ThenVariableExpressionShould12
                XCTAssert(calculation.expression == "12")
            }
    func testGivenTheExpressionHasADivisionByZero_WhenITappeOnEqual_ThenVariableDivisionByZeroShouldReturnTrue(){

       //          when ITappeOnEqual
                   calculation.expression = "8 x 3 / 0"
                   
       //          then ThenVariableExpressionIsEmptyShouldBeTrue
                   XCTAssertTrue(calculation.divisionByZero)
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
                XCTAssertFalse(calculation.expressionIsCorrect)
                XCTAssertFalse(calculation.expressionHaveEnoughElement)
            }
        
        func testGivenTheExprssionOK_WhenITappeOnEqual_ThenFunctPrionpriority0f0perationsShoukdBeReturnTheResult(){

        //          when ITappeOnEqual
                    calculation.expression = "2 + 5"
            
        //          then ThenFunctionresultShouldReturnTheResult
                    XCTAssert(calculation.priority0f0perations() == "2 + 5 = 7")
                }
        func testGivenTheExpressionIsEmpty_WhenITappeOnOperator_ThenVariableExpressionIsEmptyShouldBeFalse(){

        //          when ITappeOnEqual
                    calculation.expression = "+"
            
        //          then ThenVariableExpressionIsEmptyShouldBeTrue
                    XCTAssertFalse(calculation.expressionIsEmpty)
        }
}
