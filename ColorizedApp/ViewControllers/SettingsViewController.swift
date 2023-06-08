//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Shamkhan Mutuskhanov on 17.05.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redCountTextField: UITextField!
    @IBOutlet var greenCountTextField: UITextField!
    @IBOutlet var blueCountTextField: UITextField!
    
    @IBOutlet var redCountLabel: UILabel!
    @IBOutlet var greenCountLabel: UILabel!
    @IBOutlet var blueCountLabel: UILabel!
    
    @IBOutlet var rgbView: UIView!
    
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
        rgbView.layer.cornerRadius = 15.0
        
        redSlider.value = redSliderValue
        greenSlider.value = greenSliderValue
        blueSlider.value = blueSliderValue
        
        redCountTextField.delegate = self
        greenCountTextField.delegate = self
        blueCountTextField.delegate = self
        
        
        setColor()
        setValue()
        rgbSliderAction()
        keyboardDoneButtonSetup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func rgbSliderAction() {
        redSliderValue = redSlider.value
        greenSliderValue = greenSlider.value
        blueSliderValue = blueSlider.value
        
        setValue()
        setColor()
        keyboardAppearSetup()
    }
    
    @IBAction func doneButtonTapped() {
        delegate.updateColor(
            rgbView.backgroundColor ?? .label,
            redSlider.value,
            greenSlider.value,
            blueSlider.value
        )
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    private func setColor() {
        rgbView.backgroundColor = initialColor
        initialColor = UIColor(
            red: (CGFloat(redSlider.value)),
            green: (CGFloat(greenSlider.value)),
            blue: (CGFloat(blueSlider.value)),
            alpha: 1
        )
    }
    
    private func setValue() {
        redCountLabel.text = string(from: redSlider)
        greenCountLabel.text = string(from: greenSlider)
        blueCountLabel.text = string(from: blueSlider)
        
        redCountTextField.text = string(from: redSlider)
        greenCountTextField.text = string(from: greenSlider)
        blueCountTextField.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func keyboardDoneButtonSetup() {
        view.endEditing(true)
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: .none,
            action: #selector(keyboardDoneButtonSetup)
        )
        
        toolBar.sizeToFit()
        toolBar.items = [flexibleSpace, doneButton]
        
        let textFields = [redCountTextField, greenCountTextField, blueCountTextField]
        textFields.forEach { textField in
            textField?.inputAccessoryView = toolBar
            textField?.resignFirstResponder()
        }
    }
    
    private func keyboardWillShow(sender: Notification) {
        view.frame.origin.y = -200
    }
    
    private func keyboardWillHide(sender: Notification) {
        view.frame.origin.y = 0
    }
    
    private func keyboardAppearSetup() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil)
        { notification in self.keyboardWillShow(sender: notification) }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil)
        { notification in self.keyboardWillHide(sender: notification) }
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let value = Float(text) else {
            showAlert(
                title: "Error",
                message: "Please enter correct value.",
                textField: textField
            )
            return
        }
        
        switch textField {
        case redCountTextField:
            redSlider.setValue(value, animated: true)
            setColor()
        case greenCountTextField:
            greenSlider.setValue(value, animated: true)
            setColor()
        default:
            blueSlider.setValue(value, animated: true)
            setColor()
        }
        
        setColor()
    }
}
// MARK: - UIAlertController
extension SettingsViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

