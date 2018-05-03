//
//  RightArrowButton.swift
//  SKComponents
//
//  Created by Alexander Skorulis on 3/5/18.
//

import UIKit

public class RightArrowButton: UIButton {

    private let dynamicBackground = DynamicColorBackgroundView()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setTitleColor(SKTheme.theme.color.clouds, for: .normal)
        self.titleLabel?.textAlignment = .left
        self.contentHorizontalAlignment = .left
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        dynamicBackground.addToView(view: self)
        dynamicBackground.backgroundShape = .arrow
        dynamicBackground.backgroundColor = SKTheme.theme.color.alizarin
    }
    
    override public var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = max(size.height, 40)
        return size
    }
    
}
