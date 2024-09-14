//
//  ViewController.swift
//  MixColorApp
//
//  Created by Даниил Павленко on 10.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstColorNameLabel: UILabel!
    @IBOutlet weak var secondColorNameLabel: UILabel!
    @IBOutlet weak var resultColorNameLabel: UILabel!
    
    @IBOutlet weak var firstColorButton: UIButton!
    @IBOutlet weak var secondColorButton: UIButton!
    
    @IBOutlet weak var resultColorButton: UIButton!
    
    let systemColors: [UIColor] = [
        .systemRed, .systemGreen, .systemBlue
    ]
    
    var currentColorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mixColor(color1: firstColorButton.backgroundColor ?? .red, color2: secondColorButton.backgroundColor ?? .red)
    }
    
    @IBAction func changeColor(_ sender: UIButton) {

        // Создаем UIAlertController для выбора цвета
        let alert = UIAlertController(title: "Select color", message: nil, preferredStyle: .actionSheet)
        
        // Добавляем действия для каждого цвета в массиве
        for (index, color) in systemColors.enumerated() {
            let action = UIAlertAction(title: "\(color.accessibilityName)", style: .default) { _ in
                sender.backgroundColor = color
                self.mixColor(color1: self.firstColorButton.backgroundColor ?? .red, color2: self.secondColorButton.backgroundColor ?? .red)
                self.currentColorIndex = index
            }
            action.setValue(color, forKey: "titleTextColor")
            alert.addAction(action)
        }
        
        // Добавляем действие "Отмена"
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        
        // Показываем UIAlertController
        present(alert, animated: true)
    }
    
    private func mixColor(color1: UIColor, color2: UIColor) {
        switch(color1, color2) {
        case (UIColor.systemRed, UIColor.systemBlue):
            resultColorNameLabel.text = "purple"
            resultColorButton.backgroundColor = .systemPurple
        case (UIColor.systemBlue, UIColor.systemRed):
            resultColorNameLabel.text = "purple"
            resultColorButton.backgroundColor = .systemPurple
        case (UIColor.systemBlue, UIColor.systemGreen):
            resultColorNameLabel.text = "indigo"
            resultColorButton.backgroundColor = .systemIndigo
        case (UIColor.systemGreen, UIColor.systemBlue):
            resultColorNameLabel.text = "indigo"
            resultColorButton.backgroundColor = .systemIndigo
        case (UIColor.systemRed, UIColor.systemGreen):
            resultColorNameLabel.text = "brown"
            resultColorButton.backgroundColor = .systemBrown
        case (UIColor.systemGreen, UIColor.systemRed):
            resultColorNameLabel.text = "brown"
            resultColorButton.backgroundColor = .systemBrown
        default:
            resultColorButton.backgroundColor = color1
            resultColorNameLabel.text = color1.accessibilityName
        }
        firstColorNameLabel.text = firstColorButton.backgroundColor?.accessibilityName
        secondColorNameLabel.text = secondColorButton.backgroundColor?.accessibilityName
    }
}
