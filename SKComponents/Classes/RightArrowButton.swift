//
//  RightArrowButton.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 3/5/18.
//

import UIKit

public class RightArrowButton: UIButton {

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.textAlignment = .left
    }
    
    override public var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = max(size.height, 40)
        return size
    }
    
}
