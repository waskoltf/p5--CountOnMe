//
//  Calculator.swift
//  CountOnMe
//
//  Created by Riboku🎯 on 17/03/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculator {
    func getAddition(from operands: [Int]) -> Int {
        // operands.reduce(0) { $0 + $1 }
        var result = 0
        for operand in operands {
            result += operand
        }
        return result
    }

    func  multiplication (num1: Int, num2: Int) -> Int {
        return num1 * num2
    }

    func division (num1: Int, num2: Int) ->
    Int {
        return num1 / num2
    }

    func substraction (num1: Int, num2: Int) ->
    Int {
        return num1 - num2
    }
}
