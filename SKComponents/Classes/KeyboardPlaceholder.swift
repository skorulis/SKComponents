//
//  KeyboardPlaceholder.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 3/5/18.
//

import UIKit

public class KeyboardPlaceholder: UIView {
    
    @IBOutlet var heightContraint:NSLayoutConstraint?
    private var _heightOffset:CGFloat?
    private var heightOffset:CGFloat {
        if (_heightOffset == nil) {
            guard let w = self.window else {return 0}
            let r = w.convert(self.bounds, from: self)
            let offset = w.frame.size.height - r.maxY
            _heightOffset = max(offset, 0)
        }
        return _heightOffset ?? 0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = false
        self.setupNotifications()
        if heightContraint == nil {
            self.heightContraint = self.constraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.height}.first
        }
    }
    
    private func setupNotifications() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        if (superview != nil && (window == nil || window?.frame.size.height == 0)) {
            return; //UIView isn't yet on screen
        }
        
        guard let keyboardInfo = notification.userInfo else {return}
        guard let keyboardFrameBeginRect = (keyboardInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        guard let duration = keyboardInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        let height = keyboardFrameBeginRect.size.height - self.heightOffset
        
        set(height: height)
        UIView.animate(withDuration: duration) {
            self.superview?.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        self.set(height: 0)
    }
    
    private func set(height:CGFloat) {
        self.heightContraint?.constant = height
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
