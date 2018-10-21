//  Created by Alexander Skorulis on 10/1/18.

import UIKit

public extension UIColor {
    
    public convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    public func lighterColor(removeSaturation val: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0
        var b: CGFloat = 0, a: CGFloat = 0
        
        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            else {return self}
        
        return UIColor(hue: h, saturation: max(s - val, 0.0), brightness: b, alpha: a)
    }
    
    public func darkerColor(addSaturation val: CGFloat) -> UIColor {
        return mix(color: UIColor.black, amount: val)
    }
    
    public func mix(color:UIColor,amount:CGFloat) -> UIColor {
        var r1: CGFloat = 0
        var g1: CGFloat = 0
        var b1: CGFloat = 0
        var a1: CGFloat = 0
        
        var r2: CGFloat = 0
        var g2: CGFloat = 0
        var b2: CGFloat = 0
        var a2: CGFloat = 0
        
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        let r = r1 * (1-amount) + r2 * amount
        let g = g1 * (1-amount) + g2 * amount
        let b = b1 * (1-amount) + b2 * amount
        let a = a1 * (1-amount) + a2 * amount
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

}
