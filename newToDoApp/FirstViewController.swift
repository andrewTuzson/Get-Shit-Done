//
//  FirstViewController.swift
//  newToDoApp
//
//  Created by Angela Tuzson on 12/26/17.
//  Copyright © 2017 Andrew Tuzson. All rights reserved.
//

import UIKit
import QuartzCore

// MARK: Global Variables

var list: [String] = []

func saveData(list: [String]) {
    UserDefaults.standard.set(list, forKey: "list")
}

func fetchData() -> [String]? {
    if let list = UserDefaults.standard.array(forKey: "list") as? [String] {
        return list
    } else {
        return nil
    }
}


class FirstViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var taskStatusLabel: UILabel!
    
    // MARK: Variables
    
    var incomplete = " Incomplete "
    var complete = " Complete "
    let customGreen = UIColor(rgb: 0x7DCC87)
    let customRed = UIColor(rgb: 0xDC635F)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: Global Functions
    
//    func configureDetail() {
//        if cell.detailTextLabel?.text == complete {
//            cell.detailTextLabel?.backgroundColor = customGreen
//            cell.detailTextLabel?.textColor = UIColor.white
//            cell.detailTextLabel?.layer.masksToBounds = true
//            cell.detailTextLabel?.layer.cornerRadius = 12
//        } else if cell.detailTextLabel?.text == incomplete {
//            cell.detailTextLabel?.backgroundColor = customRed
//            cell.detailTextLabel?.textColor = UIColor.white
//            cell.detailTextLabel?.layer.masksToBounds = true
//            cell.detailTextLabel?.layer.cornerRadius = 12
//        }
//    }
    
    // MARK: IBActions


}

// MARK: Extensions

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = incomplete
        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        configureDetail()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

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

