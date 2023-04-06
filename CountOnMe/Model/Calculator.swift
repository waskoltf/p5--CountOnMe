//
//  Calculator.swift
//  CountOnMe
//
//  Created by Riboku🎯 on 17/03/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//
import Foundation

// Actions réalisés par le VC:
// - Réinitialisation du texte
// - Ajout de texte (append)
// - Afficher une alerte
protocol CalculatorDelegate {
    func clearText(initialValue: String)
    func addText(_ text: String)
    func showAlert(title: String, message: String)
}

class Calculator {

    private var delegate: CalculatorDelegate?

    init(delegate: CalculatorDelegate) {
        self.delegate = delegate
    }

    private var textCalculator: String = ""

    // 3 + 3 = -> ["3", "+", "3", "="]
    var elements: [String] {
        return textCalculator.split(separator: " ").map { "\($0)" }
    }

    // Error check computed variables
    private var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }

    private var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    private var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "×" && elements.last != "÷"
    }

    private var expressionHaveResult: Bool {
        return textCalculator.firstIndex(of: "=") != nil
    }

    var newResult: [Int] = []
//    private var result: Int = 0

    // Public Interface

    func additionButtonHasBeenTapped() {
        if expressionHaveResult {
            textCalculator = "\(newResult[0]) + "
            delegate?.clearText(initialValue: textCalculator)
        } else if canAddOperator {
            textCalculator.append(" + ")
            delegate?.addText(" + ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    func SubstractionButtonHasBeenTapped() {
        if expressionHaveResult {

            textCalculator = "\(newResult[0]) - "
            delegate?.clearText(initialValue: textCalculator)
        } else if canAddOperator {
            textCalculator.append(" - ")
            delegate?.addText(" - ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    func multiplicationnButtonHasBeenTapped() {
        if expressionHaveResult {
            textCalculator = "\(newResult[0]) x "
            delegate?.clearText(initialValue: textCalculator)
        } else if canAddOperator {
            textCalculator.append(" x ")
            delegate?.addText(" x ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    func divisionButtonHasBeenTapped() {
        if expressionHaveResult {
            textCalculator = "\(newResult[0]) ÷ "
            delegate?.clearText(initialValue: textCalculator)
        } else if canAddOperator {
            textCalculator.append(" ÷ ")
            delegate?.addText(" ÷ ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }
    func equalButtonHasBeenTapped() {
         guard expressionIsCorrect else {
             delegate?.showAlert(title: "Zero", message: "Entrez une expression correcte !")
             return
         }
         guard expressionHaveEnoughElement else {
             delegate?.showAlert(title: "Zero", message: "Démarrez un nouveau calcul !")
             return
         }
         if expressionHaveResult {
             delegate?.showAlert(title: "Information !", message: "Veuillez effacer votre calcul ou en recommencer un nouveau")
             return
         }

         // Create local copy of operations
         var operationsToReduce = elements

         // Iterate over operations while an operand still here
         while operationsToReduce.count > 1 {
             // Check for multiplication or division operators
             if let index = operationsToReduce.firstIndex(where: { $0 == "x" || $0 == "÷" }) {
                 let left = Int(operationsToReduce[index - 1])!
                 let operand = operationsToReduce[index]
                 let right = Int(operationsToReduce[index + 1])!
                 let result: Int

                 switch operand {
                 case "x": result = left * right
                 case "÷":
                     if right == 0 {
                         delegate?.showAlert(title: "zero", message: "Division par zéro impossible !")
                         return
                     }
                     result = left / right
                 default: fatalError("Unknown operator !")
                 }

                 operationsToReduce.replaceSubrange(index-1...index+1, with: ["\(result)"])

             } else {
                 let left = Int(operationsToReduce[0])!
                 let operand = operationsToReduce[1]
                 let right = Int(operationsToReduce[2])!
                 let result: Int

                 switch operand {
                 case "+": result = left + right
                 case "-": result = left - right
                 default: fatalError("Unknown operator !")
                 }

                 operationsToReduce = Array(operationsToReduce.dropFirst(3))
                 operationsToReduce.insert("\(result)", at: 0)
             }
         }
//        print(operationsToReduce.last)

         textCalculator.append(" = \(operationsToReduce.first!)")
         delegate?.addText(" = \(operationsToReduce.first!)")
                    newResult.removeAll()
         if let result = Int(operationsToReduce.first!) {
             newResult.append(result)
         }
     }

    func numberButtonHasBeenTouched(numberText: String) {
        if expressionHaveResult {
            textCalculator = numberText
            delegate?.clearText(initialValue: numberText)
        } else {
            textCalculator += numberText
            delegate?.addText(numberText)
        }
    }

    func resetAllText () {
        textCalculator = ""
        delegate?.clearText(initialValue: textCalculator)
        if textCalculator.last == nil {
            textCalculator = "0"
        }
        return
    }

}
