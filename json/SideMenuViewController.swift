//
//  SideMenuViewController.swift
//  json
//
//  Created by Esha Gundeti on 22/09/19.
//  Copyright © 2019 Felix Felicis. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    
    struct Sections {
        var sectionName : String!
        var sectionItems : [String]!
    }
    
    var sectionObject = [Sections]()
    
    var selectedRow = Int()
    var selectedSection = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionObject = [Sections(sectionName: "News Categories", sectionItems: ["General","Business","Entertainment","Health","Science","Sports","Technology","All News"]), Sections(sectionName: "User", sectionItems: ["Settings"])]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (sectionObject.count)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (sectionObject[section].sectionName)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionObject[section].sectionItems.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "option")
        cell?.textLabel?.text = sectionObject[indexPath.section].sectionItems[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        self.selectedSection = indexPath.section
        print(selectedRow)
        if indexPath.section == 0 {
            performSegue(withIdentifier: "unwind", sender: nil)
        } else if indexPath.section == 1 {
            performSegue(withIdentifier: "settings", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController {
            let vc = segue.destination as? ViewController
            vc?.backFromOptions = true
            vc?.category = self.sectionObject[self.selectedSection].sectionItems[self.selectedRow]
        }
    }
}
