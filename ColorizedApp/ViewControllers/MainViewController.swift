//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Shamkhan Mutuskhanov on 05.06.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateColor(_ color: UIColor, _ red: Float, _ green: Float, _ blue: Float)
}

final class MainViewController: UIViewController {
    // MARK: - Public Properties
    var redSliderValue: Float = 1.0
    var greenSliderValue: Float = 1.0
    var blueSliderValue: Float = 1.0
    
    
    // MARK: - UiViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.redSliderValue = redSliderValue
        settingsVC.greenSliderValue = greenSliderValue
        settingsVC.blueSliderValue = blueSliderValue
        
        settingsVC.initialColor = self.view.backgroundColor
        settingsVC.delegate = self
        
    }
}

    // MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func updateColor(_ color: UIColor, _ red: Float, _ green: Float, _ blue: Float) {
        redSliderValue = red
        greenSliderValue = green
        blueSliderValue = blue
        
        self.view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue), alpha: 1
        )
    }
}


