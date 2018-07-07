//
//  BoxRotationTransition.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 15/5/18.
//

import UIKit

public class BoxRotationTransition: NSObject {

    let leftView:UIView
    let rightView:UIView
    let container:UIView
    
    public init(container:UIView, leftView:UIView,rightView:UIView) {
        self.leftView = leftView
        self.rightView = rightView
        self.container = container
        super.init()
        //self.updateTransitionAmount(frac: 0)
        setup()
    }
    
    private func setup() {
        let width = self.leftView.frame.size.width
        self.leftView.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, width)
        
        let rightTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 0, 1, 0)
        self.rightView.layer.transform = CATransform3DTranslate(rightTransform, 0, 0, width)
    }
    
    public func updateTransitionAmount(frac:CGFloat) {
        let rot = -frac * CGFloat.pi/2
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, rot, 0, 1, 0)
        self.container.layer.transform = transform
    }
    
}
