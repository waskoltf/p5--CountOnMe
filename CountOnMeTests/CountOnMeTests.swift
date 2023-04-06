//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Riboku🎯 on 17/03/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import XCTest

@testable import CountOnMe

final class CountOnMeTests: XCTestCase {

    // sut (System Under Test)
    private var calculator: Calculator!

    private var text: String = ""
    private var alertMessage: String = ""

    func testGivenNumberOnScreen() {
//        arrange
        calculator = Calculator(delegate: self)

//        act
        calculator.numberButtonHasBeenTouched(numberText: "1")
        calculator.numberButtonHasBeenTouched(numberText: "2")
        calculator.numberButtonHasBeenTouched(numberText: "3")
        calculator.numberButtonHasBeenTouched(numberText: "4")
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.numberButtonHasBeenTouched(numberText: "6")
        calculator.numberButtonHasBeenTouched(numberText: "7")
        calculator.numberButtonHasBeenTouched(numberText: "8")
        calculator.numberButtonHasBeenTouched(numberText: "9")
        calculator.numberButtonHasBeenTouched(numberText: "10")

//        Assert
        XCTAssertTrue(self.text == "12345678910")

    }

    func testOnAddition() {
        //        arrange
                calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.additionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
//        let expectedResult = "10"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.newResult, [10])

            }

    func testOnSubstraction() {
        //        arrange
                calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "10")
        calculator.SubstractionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.equalButtonHasBeenTapped()
        //        Assert
        XCTAssertEqual(calculator.newResult, [5])

            }

    func testOnMultiplication() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.multiplicationnButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "8")
//        let expectedResult = "40"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.newResult, [40])
    }

    func testOnDivision() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "12")
        calculator.divisionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "6")
//        let expectedResult = "2"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.newResult, [2])
    }

    func testOnAdditionMultipleTime() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "12")
        calculator.additionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.additionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "3")
        calculator.additionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "2")
//        let expectedResult = "22"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.newResult, [22])
    }

    func testOnSubstractionMultipleTime() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "12")
        calculator.SubstractionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.SubstractionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "3")
        calculator.SubstractionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "2")
//        let expectedResult = "2"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.newResult, [2])
    }
    func testMultiplicationMultipleTime() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "12")
        calculator.multiplicationnButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.multiplicationnButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "3")
        calculator.multiplicationnButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "2")
//        let expectedResult = "360"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.newResult, [360])
    }
    func testOnDivisionMultipleTime() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "12")
        calculator.divisionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.divisionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "3")
        calculator.divisionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "2")
//        let expectedResult = "0"
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.elements.last, "0")
    }

    func testpriorityOfAritmeticCalcul() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "10")
        calculator.additionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.additionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "3")
        calculator.multiplicationnButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "2")
        calculator.equalButtonHasBeenTapped()

        //        Assert
        XCTAssertEqual(calculator.elements.last, "21")
    }

    func testClearAll() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.resetAllText()

        //        Assert
        XCTAssertEqual(calculator.elements.last, "0")
    }
    func testGivenIfWeDivideByZero() {
        //        arrange
        calculator = Calculator(delegate: self)

        //        act
        calculator.numberButtonHasBeenTouched(numberText: "5")
        calculator.divisionButtonHasBeenTapped()
        calculator.numberButtonHasBeenTouched(numberText: "0")

        //        Assert
        XCTAssertEqual("Division par zéro impossible !", "Division par zéro impossible !" )

    }

    }

    // MARK: - CalculatorDelegate

     extension CountOnMeTests: CalculatorDelegate {
         func clearText(initialValue: String) {
             self.text = initialValue

         }

        func resetText() {
            text = ""
        }

        func addText(_ text: String) {
            self.text.append(text)
        }

        func showAlert(title: String, message: String) {
            alertMessage = message
        }
     }

//        func testSiJeNaiPasDejaDoperateursAlorsLoperateurSajoute() {
//            // arrange
//            calculator = Calculator(delegate: self)
//
//            // act
//            calculator.additionButtonHasBeenTapped()
//
//            // assert
//            XCTAssertEqual(self.text, " + ")
//        }
//
//        func testSiJaiDejaUnOperateurAlorsJaiUnMessageDerreurQuandJajouteLoperateurPlus() {
//            // arrange
//            calculator = Calculator(delegate: self)
//            let expectedAlertMessage = "Un operateur est déja mis !"
//
//            // act
//            calculator.additionButtonHasBeenTapped()
//            calculator.additionButtonHasBeenTapped()
//
//            // assert
//            XCTAssertEqual(self.alertMessage, expectedAlertMessage)
//        }
//     }

