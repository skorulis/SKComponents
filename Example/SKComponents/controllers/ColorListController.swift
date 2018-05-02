//
//  ColorListController.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 2/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SKComponents

class ColorListController: UITableViewController {

    var colorPaths:[(String,ReferenceWritableKeyPath<SKThemeColors, UIColor>)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPaths = SKTheme.theme.color.allColors()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 60
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorPaths.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let color = colorPaths[indexPath.row]
        cell.backgroundColor = SKTheme.theme.color[keyPath:color.1]
        cell.textLabel?.text = color.0
        return cell
    }

}
