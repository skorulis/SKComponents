//
//  BendingFlowLayout.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 14/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class BendingLayoutAttributes: UICollectionViewLayoutAttributes {
    var bendAmount:CGFloat = 0
    
    override func copy() -> Any {
        let atts = super.copy() as! BendingLayoutAttributes
        atts.bendAmount = self.bendAmount
        return atts
    }
    
}

class BendingFlowLayout: UICollectionViewFlowLayout {

    private let maxVelocity:Double = 500
    
    var lastScroll:TimeInterval = 0
    var lastPoint:CGPoint = .zero
    var bendAmount:CGFloat = 0
    
    func didScroll(point:CGPoint) {
        let time = Date().timeIntervalSince1970
        let diff = time - lastScroll
        let mov = point.y - lastPoint.y
        var vel = Double(mov) / diff
        
        if abs(vel) > maxVelocity {
            vel = maxVelocity * copysign(-1, vel)
        }
        bendAmount = CGFloat(vel/maxVelocity) * -1
        
        lastScroll = time
        lastPoint = point
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let biggerRect = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height + 200)
        let atts = super.layoutAttributesForElements(in: biggerRect) as! [BendingLayoutAttributes]?
        atts?.forEach { $0.bendAmount = self.bendAmount}
        return atts
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override class var layoutAttributesClass:AnyClass {
        return BendingLayoutAttributes.self
    }
    
}
