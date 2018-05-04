//
//  DynamicColorBackgroundView.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 3/5/18.
//

import UIKit

enum BackgroundShapeType {
    case none
    case arrow
}

class DynamicColorBackgroundView: UIView, CAAnimationDelegate {
    
    var backgroundShape:BackgroundShapeType = .none
    
    private let mainClippingLayer = CAShapeLayer()
    private var animationLayer = CALayer()
    private var animationColor:UIColor = UIColor.white
    
    override class var layerClass:AnyClass {
        return CALayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.isUserInteractionEnabled = false
    }
    
    func addToView(view:UIView) {
        view.insertSubview(self, at: 0)
        self.frame = view.bounds
        self.autoresizingMask =  [.flexibleWidth, .flexibleHeight]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.animationLayer.frame = self.bounds
        
        if (self.backgroundShape == .arrow) {
            self.mainClippingLayer.frame = self.bounds
            self.layer.mask = self.mainClippingLayer
            arrowLayer()
        } else {
            self.layer.mask = nil
        }
        
    }
    
    func arrowLayer() {
        let path = UIBezierPath()
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        let arrowWidth:CGFloat = height * 0.8
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width-arrowWidth, y: 0))
        path.addLine(to: CGPoint(x: width, y: height/2))
        path.addLine(to: CGPoint(x: width-arrowWidth, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        
        self.mainClippingLayer.path = path.cgPath
        self.mainClippingLayer.fillColor = UIColor.black.cgColor
    }
    
    override var backgroundColor: UIColor? {
        set {
            self.layer.backgroundColor = newValue?.cgColor
        }
        get {
            if let c = self.layer.backgroundColor {
                return UIColor(cgColor: c)
            }
            return nil
        }
    }
    
    func animateBackground(color:UIColor) {
        self.animationColor = color
        self.animationLayer.backgroundColor = color.cgColor
        self.layer.addSublayer(self.animationLayer)
        
        let circleLayer = CAShapeLayer()
        circleLayer.frame = self.bounds
        
        let height = self.frame.size.height
        let width = self.frame.size.width
        
        let path = UIBezierPath(ovalIn: CGRect(x: (width-height)/2, y: 0, width: height, height: height))
        let endPath = UIBezierPath(ovalIn: CGRect(x: 0, y: (height-width)/2, width: width, height: width))
        circleLayer.path = path.cgPath
        self.animationLayer.mask = circleLayer
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endPath.cgPath
        animation.duration = 0.25
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.delegate = self
        circleLayer.add(animation, forKey: animation.keyPath)
    }
    
    //MARK: CAAnimationDelegate
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.layer.backgroundColor = self.animationColor.cgColor
        self.animationLayer.removeFromSuperlayer()
        self.animationLayer.mask = nil
    }
    
}
