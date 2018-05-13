//
//  BendingBackgroundView.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 14/5/18.
//

import UIKit

public class BendingBackgroundView: UIView {

    public var bendAmount:CGFloat = 0 {
        didSet {
            updatePath()
        }
    }
    
    override public class var layerClass:AnyClass {
        return CAShapeLayer.self
    }
    
    private var shapeLayer:CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    private func updatePath() {
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let movement:CGFloat = bendAmount * width * 0.1
        
        let path = UIBezierPath();
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: 0), controlPoint: CGPoint(x: width/2, y: movement))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addQuadCurve(to: CGPoint(x: 0, y: height), controlPoint: CGPoint(x: width/2, y: height+movement))
        path.close()
        
        self.shapeLayer.path = path.cgPath
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }
    
    override public var backgroundColor: UIColor? {
        set {
            self.shapeLayer.fillColor = newValue?.cgColor
        }
        get {
            if let c = self.shapeLayer.fillColor {
                return UIColor(cgColor: c)
            }
            return nil
        }
    }
}
