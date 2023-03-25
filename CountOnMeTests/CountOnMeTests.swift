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

    func testAddition() {
        // arrange, act, assert
        //
        // arrange
        let calculator = Calculator()
        let operands: [Int] = [1, 2, 3]
        let expectedResult = 6
        // act
        let result = calculator.getAddition(from: operands)
        // assert
        XCTAssertEqual(result, expectedResult, "The result should be \(expectedResult), instead it's: \(result)")
    }
    func testSubstraction() {
        // arrange, act, assert
        //
        // arrange
        let calculator = Calculator()
        let num1 = 10
        let num2 = 3
        let expectedResult = 7
//        Act
        let actualDifference = calculator.substraction(num1: num1, num2: num2)

        // Assert
             XCTAssertEqual(actualDifference, expectedResult)    }

    func testMultiplication() {
        // arrange, act, assert
        //
        // arrange
        // Arrange
        let calculator = Calculator()
        let num1 = 5
        let num2 = 7
        let expectedProduct = 35
        // Act
        let actualProduct = calculator.multiplication(num1: num1, num2: num2)

        // Assert
        XCTAssertEqual(actualProduct, expectedProduct)
    }
    func testDivision() {
        // arrange, act, assert
        //
        // arrange
        let calculator = Calculator()
        let num1 = 14
        let num2 = 2
        let expectedQuotient = 7
        // Act
        let actualQuotient = calculator.division(num1: num1, num2: num2)
        // Assert
        XCTAssertEqual(actualQuotient, expectedQuotient)
    }
    }
