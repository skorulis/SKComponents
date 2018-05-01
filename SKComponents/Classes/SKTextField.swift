//
//  SKTextField.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 1/5/18.
//

import UIKit

class SKTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.borderStyle = .none
        self.backgroundColor = SKTheme.theme.color.peterRiver
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += 40
        return size
    }

}
