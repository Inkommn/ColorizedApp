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
    
    var delegate: SettingsViewControllerDelegate!
    
    var initialColor: UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbSlidersAction()
        rgbView.layer.cornerRadius = 15.0
    }
    
    // MARK: - IBActions
    @IBAction func rgbSlidersAction() {
        redSlider.tintColor = .red
        blueSlider.tintColor = .blue
        greenSlider.tintColor = .green

        updateRGBViewColor()
        
        rgbCountLabels()
    }
    
    @IBAction func doneButtonDidTapped() {
        delegate.setColors(initialColor)
        dismiss(animated: true)
        
    }
    
    // MARK: - Public methods
    func rgbCountLabels() {
        redCountLabel.text = String(format: "%.2f", redSlider.value)
        greenCountLabel.text = String(format: "%.2f", greenSlider.value)
        blueCountLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: - Private methods
    private func updateRGBViewColor() {
        rgbView.backgroundColor = initialColor
        initialColor = UIColor(
            red: (CGFloat(redSlider.value)),
            green: (CGFloat(greenSlider.value)),
            blue: (CGFloat(blueSlider.value)),
            alpha: 1
        )
    }
}
