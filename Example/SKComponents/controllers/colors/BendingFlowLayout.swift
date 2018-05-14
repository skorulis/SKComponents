//
//  BendingFlowLayout.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 14/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

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
        let cal = CGFloat(vel/maxVelocity) * -1
        bendAmount = bendAmount * 0.1 + cal * 0.9
        
        //print("diff \(diff)")
        //print(bendAmount)
        
        lastScroll = time
        lastPoint = point
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
