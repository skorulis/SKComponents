//
//  SKTextField.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 1/5/18.
//

import UIKit

public class SKTextField: UITextField {
    
    private let dynamicBackground = DynamicColorBackgroundView()
    
    public var placeholderColor:UIColor {
        didSet {
            self.placeholder = super.placeholder
        }
    }
    
    public var errorState:Bool = false {
        didSet {
            updateBackgroundColor(animate:true)
        }
    }
    
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
        dynamicBackground.addToView(view: self)
        updateBackgroundColor(animate:false)
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
    
    private func updateBackgroundColor(animate:Bool) {
        var color = SKTheme.theme.color.peterRiver
        if self.errorState {
            color = SKTheme.theme.color.pomegranate
        } else {
            if (self.isFirstResponder) {
                color = SKTheme.theme.color.amethyst
            }
        }
        self.layer.borderColor = color.cgColor
        if (animate) {
            self.dynamicBackground.animateBackground(color: color.withAlphaComponent(0.25))
        } else {
            self.dynamicBackground.backgroundColor = color.withAlphaComponent(0.25)
        }
        
    }
    
    //MARK: Events
    
    override public func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        self.updateBackgroundColor(animate:true)
        return result
    }
    
    override public func resignFirstResponder() -> Bool {
        let result = super.resignFirstResponder()
        self.updateBackgroundColor(animate:true)
        return result
    }
    
    //MARK: UITextfield overrides
    
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
