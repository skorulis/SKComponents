//
//  ColorListCell.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 14/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SKComponents

class ColorListCell: UICollectionViewCell {

    let label = UILabel()
    private let bendingBackground = BendingBackgroundView()
    private var baseBackgroundColor:UIColor? = UIColor.brown
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        self.backgroundView = bendingBackground
    }
    
    func updateColour() {
        if (isSelected || isHighlighted) {
            bendingBackground.backgroundColor = self.backgroundColor?.lighterColor(removeSaturation: 0.5)
        } else {
            bendingBackground.backgroundColor = self.backgroundColor
        }
    }
    
    var bendAmount: CGFloat {
        set {
            bendingBackground.bendAmount = newValue
        }
        get {
            return bendingBackground.bendAmount
        }
    }
    
    override var backgroundColor: UIColor? {
        set {
            baseBackgroundColor = newValue
            updateColour()
        }
        get {
            return baseBackgroundColor
        }
    }
    
    override var isSelected: Bool {
        didSet {
            updateColour()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateColour()
        }
    }
    
}
