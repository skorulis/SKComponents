//
//  BendingBackgroundViewController.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 14/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SKComponents

class BendingBackgroundViewController: UIViewController {

    @IBOutlet var example:BendingBackgroundView!
    @IBOutlet var slider:UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        example.backgroundColor = SKTheme().color.sunflower
    }
    
    @IBAction func sliderChanged(slider:UISlider) {
        example.bendAmount = CGFloat(slider.value * 2) - 1
    }
    
}
