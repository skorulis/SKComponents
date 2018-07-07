//
//  BoxTransitionViewController.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 15/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SKComponents

class BoxTransitionViewController: UIViewController {
    
    @IBOutlet var slider:UISlider!
    @IBOutlet var view1:UILabel!
    @IBOutlet var view2:UILabel!
    @IBOutlet var container:UIView!
    
    var boxTransition:BoxRotationTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.boxTransition = BoxRotationTransition(container:container, leftView: view1, rightView: view2)
        
    }
    
    @IBAction func sliderChanged(slider:UISlider) {
        self.boxTransition.updateTransitionAmount(frac:CGFloat(slider.value))
    }

}
