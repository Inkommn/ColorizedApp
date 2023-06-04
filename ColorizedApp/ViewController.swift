//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Shamkhan Mutuskhanov on 17.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets

    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redCountTextField: UITextField!
    @IBOutlet var greenCountTextField: UITextField!
    @IBOutlet var blueCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSliderAction()
        greenSliderAction()
        blueSliderAction()

        rgbView.layer.cornerRadius = 30.0
    }
    
    // MARK: - IBActions
    @IBAction func redSliderAction() {
//        redCountLabel.text = String(format: "%.2f", redSlider.value)
        redSlider.tintColor = .red
        
        updateRGBViewColor()
    }
    
    @IBAction func greenSliderAction() {
       
        greenSlider.tintColor = .green
        
        updateRGBViewColor()
    }
    
    @IBAction func blueSliderAction() {
       
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

