//
//  SKTextField.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 1/5/18.
//

import UIKit

public class SKTextField: UITextField {
    
    public var placeholderColor:UIColor {
        didSet {
            self.placeholder = super.placeholder
        }
    }
    
    public var errorState:Bool = false
    
    public required init?(coder aDecoder: NSCoder) {
        placeholderColor = UIColor.white
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.borderStyle = .none
        self.font = SKTheme.theme.font.textfieldFont
        self.textColor = SKTheme.theme.color.midnightBlue
        self.placeholderColor = self.textColor!.withAlphaComponent(0.6)
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 3
        self.layer.borderColor = SKTheme.theme.color.peterRiver.cgColor
        self.backgroundColor = SKTheme.theme.color.peterRiver.withAlphaComponent(0.25)
    }
    
    public override var placeholder: String? {
        get {
            return super.placeholder
        }
        set {
            if let v = newValue {
                let att = NSAttributedString(string: v, attributes: [NSAttributedStringKey.foregroundColor:self.placeholderColor])
                super.attributedPlaceholder = att
            } else {
                super.placeholder = newValue
            }
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += 40
        return size
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 8, y: bounds.origin.y, width: bounds.size.width - 16, height: bounds.size.height)
    }
    
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds:bounds)
    }

}
