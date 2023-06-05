//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Shamkhan Mutuskhanov on 05.06.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColors(_ color: UIColor)
}

final class MainViewController: UIViewController {
    var color: UIColor!
    
    
    // MARK: - UiViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.rgbView?.backgroundColor = color
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setColors(_ color: UIColor) {
        self.color = view.backgroundColor
    }
}
