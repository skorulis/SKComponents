//
//  SKTheme.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 1/5/18.
//

import UIKit

open class SKThemeColors {
    
    private var registeredColors = [String:UIColor]()
    
    //https://flatuicolors.com/palette/defo
    public var turquioise = UIColor(rgb: 0x1abc9c)
    public var emerald = UIColor(rgb: 0x2ecc71)
    public var peterRiver = UIColor(rgb:0x3498db)
    public var amethyst = UIColor(rgb: 0x9b59b6)
    public var wetAsphalt = UIColor(rgb: 0x34495e)
    public var greenSea = UIColor(rgb: 0x16a085)
    public var nephritis = UIColor(rgb: 0x27ae60)
    public var belizeHole = UIColor(rgb: 0x2980b9)
    public var wisteria = UIColor(rgb: 0x8e44ad)
    public var midnightBlue = UIColor(rgb: 0x2c3e50)
    public var sunflower = UIColor(rgb: 0xf1c40f)
    public var carrot = UIColor(rgb: 0xe67e22)
    public var alizarin = UIColor(rgb: 0xe74c3c)
    public var clouds = UIColor(rgb: 0xecf0f1)
    public var concrete = UIColor(rgb: 0x95a5a6)
    public var orange = UIColor(rgb: 0xf39c12)
    public var pumpkin = UIColor(rgb: 0xd35400)
    public var pomegranate = UIColor(rgb: 0xc0392b)
    public var silver = UIColor(rgb: 0xbdc3c7)
    public var asbestos = UIColor(rgb: 0x7f8c8d)
    
    public func allColors() -> [(String,ReferenceWritableKeyPath<SKThemeColors, UIColor>)] {
        let colorPaths:[ReferenceWritableKeyPath<SKThemeColors, UIColor>] = [\SKThemeColors.turquioise,\SKThemeColors.emerald,\SKThemeColors.peterRiver,\SKThemeColors.amethyst,\SKThemeColors.wetAsphalt,\SKThemeColors.greenSea,\SKThemeColors.nephritis,\SKThemeColors.belizeHole,\SKThemeColors.wisteria,\SKThemeColors.midnightBlue,\SKThemeColors.sunflower,\SKThemeColors.carrot,\SKThemeColors.alizarin,\SKThemeColors.clouds,\SKThemeColors.concrete,\SKThemeColors.orange,\SKThemeColors.pumpkin,\SKThemeColors.pomegranate,\SKThemeColors.silver,\SKThemeColors.asbestos]
        
        let colorNames:[String] = ["turquioise","emerald","peterRiver","amethyst","wetAsphalt","greenSea","nephritis","belizeHole","wisteria","midnightBlue","sunflower","carrot","alizarin","clouds","concrete","orange","pumpkin","pomegranate","silver","asbestos"]
        
        var joined:[(String,ReferenceWritableKeyPath<SKThemeColors, UIColor>)] = []
        for i in 0..<colorPaths.count {
            let pair = (colorNames[i],colorPaths[i])
            joined.append(pair)
        }
        
        return joined
    }
    
    public func register(color:UIColor,name:String) {
        registeredColors[name] = color
    }
    
    public func getColor(name:String) -> UIColor? {
        return registeredColors[name]
    }
    
    public func allRegisteredColors() -> [String:UIColor] {
        return self.registeredColors
    }
    
}

open class SKThemeFonts {
    
    var textfieldFont = UIFont.systemFont(ofSize: 18)
    var selectionButtonTitle = UIFont.boldSystemFont(ofSize: 18)
    var selectionButtonValue = UIFont.systemFont(ofSize: 18)
    
}

open class SKTheme: NSObject {
    
    public static var theme = SKTheme()
    static var color:SKThemeColors {
        return self.theme.color
    }
    
    public var color = SKThemeColors()
    public var font = SKThemeFonts()
    
}
