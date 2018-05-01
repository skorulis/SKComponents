//
//  SKTheme.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 1/5/18.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

class SKThemeColors {
    
    //https://flatuicolors.com/palette/defo
    var turquioise = UIColor(rgb: 0x1abc9c)
    var emerald = UIColor(rgb: 0x2ecc71)
    var peterRiver = UIColor(rgb:0x3498db)
    var amethyst = UIColor(rgb: 0x9b59b6)
    var wetAsphalt = UIColor(rgb: 0x34495e)
    var greenSea = UIColor(rgb: 0x16a085)
    var nephritis = UIColor(rgb: 0x27ae60)
    var belizeHole = UIColor(rgb: 0x2980b9)
    var wisteria = UIColor(rgb: 0x8e44ad)
    var midnightBlue = UIColor(rgb: 0x2c3e50)
    var sunflower = UIColor(rgb: 0xf1c40f)
    var carrot = UIColor(rgb: 0xe67e22)
    var alizarin = UIColor(rgb: 0xe74c3c)
    var clouds = UIColor(rgb: 0xecf0f1)
    var concrete = UIColor(rgb: 0x95a5a6)
    var orange = UIColor(rgb: 0xf39c12)
    var pumpkin = UIColor(rgb: 0xd35400)
    var pomegranate = UIColor(rgb: 0xc0392b)
    var silver = UIColor(rgb: 0xbdc3c7)
    var asbestos = UIColor(rgb: 0x7f8c8d)
    
    
    
}

class SKFonts {
    
}

class SKTheme: NSObject {
    static var theme = SKTheme()
    
    var color = SKThemeColors()
    var font = SKFonts()
    
}
