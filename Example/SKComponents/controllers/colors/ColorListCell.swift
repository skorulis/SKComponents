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
    let bendingBackground = BendingBackgroundView()
    
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
        bendingBackground.bendAmount = 1
        self.backgroundView = bendingBackground
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let atts = layoutAttributes as? BendingLayoutAttributes {
            //bendingBackground.bendAmount = atts.bendAmount
        }
    }
    
}
