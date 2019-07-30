//
//  IconPickerViewController.swift
//  Checklists
//
//  Created by Ryan Fischbach on 2/1/17.
//  Copyright © 2017 Ryan Fischbach. All rights reserved.
//

import Foundation
import UIKit
protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips" ]
    
    var colors : [String:UIColor] =
        ["No Icon": UIColor.black,
         "Appointments": UIColor.red,
         "Birthdays": UIColor.yellow,
         "Chores": UIColor.orange,
         "Drinks": UIColor.purple,
         "Folder":UIColor.brown,
         "Groceries": UIColor.green,
         "Inbox": UIColor.blue,
         "Photos": UIColor.gray,
         "Trips": UIColor.cyan]
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
                            return icons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "IconCell", for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        cell.textLabel!.textColor = colors[iconName]
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
            delegate.iconPicker(self, didPick: iconName)
        }
    }
    
}
