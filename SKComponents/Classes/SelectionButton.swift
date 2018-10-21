//
//  SelectionButton.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 19/10/18.
//

import UIKit

public class SelectionButton: RightArrowButton {
    
    var titleString:String?
    public var valueString:String? {
        didSet {
            self.updateAttributedTitle()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.titleString = self.currentTitle
        self.titleLabel?.numberOfLines = 0
        self.tintColor = SKTheme.color.asbestos.darkerColor(addSaturation: 0.75)
        self.buttonColor = SKTheme.theme.color.peterRiver.lighterColor(removeSaturation: 0.5)
        
        updateAttributedTitle()
    }
    
    private func updateAttributedTitle() {
        let textColor:UIColor = self.tintColor
        
        
        let attTitle = NSMutableAttributedString(string: self.titleString!, attributes: [
            NSAttributedString.Key.foregroundColor:textColor,
            NSAttributedString.Key.font:SKTheme.theme.font.selectionButtonTitle
                    ])
        if let value = valueString {
            let valueAtt = NSAttributedString(string: "\n\(value)", attributes: [
                NSAttributedString.Key.foregroundColor:textColor,
                NSAttributedString.Key.font:SKTheme.theme.font.selectionButtonValue
                ])
            attTitle.append(valueAtt)
        }
        
        self.setAttributedTitle(attTitle, for: .normal)
    }
    
}
