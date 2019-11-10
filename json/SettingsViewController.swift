//
//  SettingsViewController.swift
//  json
//
//  Created by Esha Gundeti on 23/09/19.
//  Copyright © 2019 Felix Felicis. All rights reserved.
//

import UIKit
import Eureka

class SettingsViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
            form
                +++ Section("Country")
            <<< PushRow<String>() {
                $0.title = "Preferred Country"
                $0.options = ["Argentina", "Australia", "Austria", "Belgium", "Brazil", "Bulgaria", "Canada", "China", "Colombia", "Cuba","Czech Republic", "Egypt",
                              "France",
                              "Germany",
                              "Greece",
                              "Hong Kong",
                              "Hungary",
                              "India",
                              "Indonesia",
                              "Ireland",
                              "Israel",
                              "Italy",
                              "Japan",
                              "Latvia",
                              "Lithuania",
                              "Malaysia",
                              "Mexico",
                              "Morocco",
                              "Netherlands",
                              "New Zealand",
                              "Nigeria",
                              "Norway",
                              "Philippines",
                              "Poland",
                              "Portugal",
                              "Romania",
                              "Russia",
                              "Saudi Arabia",
                              "Serbia",
                              "Singapore",
                              "Slovakia",
                              "Slovenia",
                              "South Africa",
                              "South Korea",
                              "Sweden",
                              "Switzerland",
                              "Taiwan",
                              "Thailand",
                              "Turkey",
                              "UAE",
                              "Ukraine",
                              "United Kingdom",
                              "United States",
                              "Venuzuela"]
                $0.onChange { [unowned self] row in
                    if let value = row.value {
                        print("selected")
                    }
                }
        }
    }
}
