//
//  ColorListCollectionViewController.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 14/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SKComponents

class ColorListCollectionViewController: UICollectionViewController {

    private let layout = BendingFlowLayout()
    var colorPaths:[(String,ReferenceWritableKeyPath<SKThemeColors, UIColor>)] = []
    
    public init() {
        super.init(collectionViewLayout: self.layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.register(ColorListCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView?.backgroundColor = UIColor.white
        colorPaths = SKTheme.theme.color.allColors()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.layout.itemSize = CGSize(width: self.view.frame.size.width, height: 80)
        self.layout.minimumLineSpacing = 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorPaths.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorListCell
        let color = colorPaths[indexPath.row]
        cell.bendingBackground.backgroundColor = SKTheme.theme.color[keyPath:color.1]
        cell.label.text = color.0
        cell.bendingBackground.bendAmount = layout.bendAmount
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.layout.didScroll(point: scrollView.contentOffset)
        self.layout.invalidateLayout()
        self.collectionView?.visibleCells.forEach { ($0 as! ColorListCell).bendingBackground.bendAmount = layout.bendAmount}
    }
    
}
