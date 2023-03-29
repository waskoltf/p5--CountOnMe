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
    func ClearText()
    func addText(_ text: String)
    func showAlert(title: String, message: String)
//    func actualTexte(_texte: String)
    func actualTexte(_: String)
}

class Calculator {

    private var delegate: CalculatorDelegate?

    init(delegate: CalculatorDelegate) {
        self.delegate = delegate
    }

  var textCalculator: String = ""

    // 3 + 3 = -> ["3", "+", "3", "="]
    private var elements: [String] {
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

    // Public Interface

    func additionButtonHasBeenTapped() {
        if canAddOperator {
            textCalculator.append(" + ")
            delegate?.addText(" + ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }

    func SubstractionButtonHasBeenTapped() {
        if canAddOperator {
            textCalculator.append(" - ")
            delegate?.addText(" - ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }
    func multiplicationnButtonHasBeenTapped() {
        if canAddOperator {
            textCalculator.append(" x ")
            delegate?.addText(" x ")
        } else {
            delegate?.showAlert(title: "Zéro!", message: "Un operateur est déja mis !")
        }
    }
    func divisionButtonHasBeenTapped() {
        if canAddOperator {
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
        // Create local copy of operations
        var operationsToReduce = elements
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "÷":
                if right == 0 {
                    delegate?.showAlert(title: "zero", message: "Division par zéro impossible !")
                }
                result = left / right
            default: fatalError("Unknown operator !")
            }
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        delegate?.addText(" = \(operationsToReduce.first!)")
        print("fini")
    }

//    private func resetText(texte: String) {
//        delegate?.actualTexte(_texte: texte)
//       }

    func numberButtonHasBeenTouched(numberText: String) {
        if expressionHaveResult {
            delegate?.ClearText()
        }
        textCalculator += numberText
        delegate?.actualTexte(_: numberText)

    }
}
