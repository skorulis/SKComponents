//
//  SKTheme.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 1/5/18.
//

import UIKit

class SKThemeColors {
    
    let neutral1 = UIColor(red: 0.5, green: 0.5, blue: 0.05, alpha: 1)
    
}

class SKTheme: NSObject {
    static var theme = SKTheme()
    
    var color = SKThemeColors()
    
}
