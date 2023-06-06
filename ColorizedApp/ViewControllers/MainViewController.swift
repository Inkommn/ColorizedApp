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
var backgroundColor: UIColor!

final class MainViewController: UIViewController {
    // MARK: - UiViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self

    }
}

    // MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setColors(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
