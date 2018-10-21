//
//  ButtonsViewController.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 4/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SKComponents

class ButtonsViewController: UIViewController {

    @IBOutlet var button1:RightArrowButton!
    @IBOutlet var button2:SelectionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button2.buttonColor = SKTheme.theme.color.peterRiver.lighterColor(removeSaturation: 0.5)
    }
    
    @IBAction func didPressButton2(sender:UIButton) {
        button2.valueString = "Selected value";
    }
}
