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
    
    
}
