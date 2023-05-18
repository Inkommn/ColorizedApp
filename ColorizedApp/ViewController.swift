//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Shamkhan Mutuskhanov on 17.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var redCountLabel: UILabel!
    @IBOutlet var greenCountLabel: UILabel!
    @IBOutlet var blueCountLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var rgbView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSliderAction()
        greenSliderAction()
        blueSliderAction()

        rgbView.layer.cornerRadius = 20.0
    }
    
    // MARK: - IBActions
    @IBAction func redSliderAction() {
        let redValue = redSlider.value
        let formattedValue = String(format: "%.2f", redValue)
        redCountLabel.text = formattedValue
        redSlider.tintColor = .red
        
        updateRGBViewColor()
    }
    
    @IBAction func greenSliderAction() {
        let greenValue = greenSlider.value
        let formattedValue = String(format: "%.2f", greenValue)
        greenCountLabel.text = formattedValue
        greenSlider.tintColor = .green
        
        updateRGBViewColor()
    }
    
    @IBAction func blueSliderAction() {
        let blueValue = blueSlider.value
        let formattedValue = String(format: "%.2f", blueValue)
        blueCountLabel.text = formattedValue
        blueSlider.tintColor = .blue
        
        updateRGBViewColor()
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
    
}

