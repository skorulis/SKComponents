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
    
    private let shadowLayer = CALayer()
    
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
        
        /*self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
        self.layer.shadowPath = path.cgPath //Shadow on top line*/
        
        self.shapeLayer.path = path.cgPath
        
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        if self.shadowLayer.superlayer == nil {
            self.layer.addSublayer(self.shadowLayer)
        }
        //self.shadowLayer.frame = self.bounds
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
