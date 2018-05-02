//
//  ComponentListViewController.swift
//  SKComponents_Example
//
//  Created by Alexander Skorulis on 1/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

struct ComponentExample {
    let title:String
    let createBlock:() -> (UIViewController)
}

class ComponentListViewController: UITableViewController {

    var components:[ComponentExample] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        components.append(ComponentExample(title: "Colors", createBlock: { () -> (UIViewController) in
            return ColorListController(nibName: nil, bundle: nil)
        }));
        components.append(ComponentExample(title: "TextFields", createBlock: { () -> (UIViewController) in
            return TextFieldViewController(nibName: nil, bundle: nil)
        }));
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = components[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = components[indexPath.row].createBlock()
        vc.title = components[indexPath.row].title
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
