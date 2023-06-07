//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Shamkhan Mutuskhanov on 17.05.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redCountTextField: UITextField!
    @IBOutlet var greenCountTextField: UITextField!
    @IBOutlet var blueCountTextField: UITextField!
    
    @IBOutlet var redCountLabel: UILabel!
    @IBOutlet var greenCountLabel: UILabel!
    @IBOutlet var blueCountLabel: UILabel!
    
    // MARK: - Public properties
    var redSliderValue: Float = 1.0
    var greenSliderValue: Float = 1.0
    var blueSliderValue: Float = 1.0
    
    var delegate: SettingsViewControllerDelegate!
    var initialColor: UIColor!
    
    let toolBar = UIToolbar()

    // MARK: - UiViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = redSliderValue
        greenSlider.value = greenSliderValue
        blueSlider.value = blueSliderValue
        
        redCountTextField.delegate = self
        greenCountTextField.delegate = self
        blueCountTextField.delegate = self
        
        
        keyboardDoneButtonTapped()
        rgbSlidersAction()
        rgbView.layer.cornerRadius = 15.0
    }
    
    // MARK: - IBActions
    @IBAction func rgbSlidersAction() {
        redSliderValue = redSlider.value
        greenSliderValue = greenSlider.value
        blueSliderValue = blueSlider.value
        
        redSlider.tintColor = .red
        blueSlider.tintColor = .blue
        greenSlider.tintColor = .green

        updateRGBViewColor()
        rgbCountLabels()
        
    }
    
    @IBAction func doneButtonDidTapped() {
        delegate.updateColor(
            rgbView.backgroundColor ?? .label,
            redSliderValue,
            greenSliderValue,
            blueSliderValue
        )
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func updateRGBViewColor() {
        rgbView.backgroundColor = UIColor(
            red: (CGFloat(redSlider.value)),
            green: (CGFloat(greenSlider.value)),
            blue: (CGFloat(blueSlider.value)),
            alpha: 1
        )
    }
    
    private func rgbCountLabels() {
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
        
        redCountTextField.text = String(format: "%.2f", redSlider.value)
        greenCountTextField.text = String(format: "%.2f", greenSlider.value)
        blueCountTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    @objc private func keyboardDoneButtonTapped() {
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: .none,
            action: #selector(keyboardDoneButtonTapped)
        )
        toolBar.sizeToFit()
        toolBar.items = [flexibleSpace, doneButton]
        redCountTextField.inputAccessoryView = toolBar
        redCountTextField.resignFirstResponder()
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == redCountTextField {
            if let value = Float(textField.text ?? "") {
                redSlider.value = value
            }
        } else if textField == greenCountTextField {
            if let value = Float(textField.text ?? "") {
                greenSlider.value = value
            }
        } else if textField == blueCountTextField {
            if let value = Float(textField.text ?? "") {
                blueSlider.value = value
            }
        }
    }
}
