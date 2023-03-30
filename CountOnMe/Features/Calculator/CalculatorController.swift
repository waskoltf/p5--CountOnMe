//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

// Le ViewController doit afficher l'input et envoyer l'output vers le Model
// 1 + 2 =
// -> Input envoyé vers le Calculator
// -> Output est envoyé par le Calculator
// SRP : Single Responsability Principle (wiki)

// Deux manières de communiquer entre un VC et un Model:
// - Soit par closure
// - Soit par protocol

class CalculatorController: UIViewController {

    // MARK: - Views

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Properties

    private var calculator: Calculator!

    // View Life cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        calculator = Calculator(delegate: self)
    }

    // View actions

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
               return
           }
        calculator.numberButtonHasBeenTouched(numberText: numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calculator.additionButtonHasBeenTapped()
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calculator.SubstractionButtonHasBeenTapped()
    }
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        calculator.multiplicationnButtonHasBeenTapped()
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        calculator.divisionButtonHasBeenTapped()
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.equalButtonHasBeenTapped()

    }

}

// MARK: - CalculatorDelegate

extension CalculatorController: CalculatorDelegate {

    func clearText(initialValue: String) {
        textView.text = initialValue
    }

    func addText(_ text: String) {
        textView.text.append(text)
    }

    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        alertVC.addAction(UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil)
        )

        present(
            alertVC,
            animated: true,
            completion: nil
        )
    }
}
