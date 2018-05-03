//
//  DynamicColorBackgroundView.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 3/5/18.
//

import UIKit

class DynamicColorBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = false
    }
    
    func addToView(view:UIView) {
        view.insertSubview(self, at: 0)
        self.frame = view.bounds
        self.autoresizingMask =  [.flexibleWidth, .flexibleHeight]
    }
    
}
