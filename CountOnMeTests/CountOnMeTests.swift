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

    func testAdditionButtonAddsPlusOperatorWhenExpressionDoesNotHaveResult() {
           calculator = Calculator(delegate: self)
           calculator.numberButtonHasBeenTouched(numberText: "2")
           calculator.additionButtonHasBeenTapped()

           XCTAssertEqual(calculator.elements, ["2", "+"])
       }
    func testAdditionButtonDoesNotAddPlusOperatorWhenExpressionHasResult() {
        calculator = Calculator(delegate: self)
        calculator.numberButtonHasBeenTouched(numberText: "2")
        calculator.additionButtonHasBeenTapped()
        calculator.equalButtonHasBeenTapped()
        calculator.additionButtonHasBeenTapped()

        XCTAssertEqual(calculator.elements, ["4", "+"])
    }

        func testSiJeNaiPasDejaDoperateursAlorsLoperateurSajoute() {
            // arrange
            calculator = Calculator(delegate: self)

            // act
            calculator.additionButtonHasBeenTapped()

            // assert
            XCTAssertEqual(self.text, " + ")
        }

        func testSiJaiDejaUnOperateurAlorsJaiUnMessageDerreurQuandJajouteLoperateurPlus() {
            // arrange
            calculator = Calculator(delegate: self)
            let expectedAlertMessage = "Un operateur est déja mis !"

            // act
            calculator.additionButtonHasBeenTapped()
            calculator.additionButtonHasBeenTapped()

            // assert
            XCTAssertEqual(self.alertMessage, expectedAlertMessage)
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
