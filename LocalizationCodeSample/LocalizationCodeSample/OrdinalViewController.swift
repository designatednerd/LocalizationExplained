//
//  MasterViewController.swift
//  LocalizationCodeSample
//
//  Created by Ellen Shapiro on 8/17/15.
//  Copyright © 2015 Designated Nerd Software. All rights reserved.
//

import UIKit

class OrdinalViewController: UITableViewController {

    let cellIdentifier = "OrdinalCell"
    let numberFormatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .OrdinalStyle
        return formatter
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("ordinalvc.title",
            value: "Ordinal Numbers",
            comment: "Title for a list of ordinal numbers")
    }
}

//MARK: - UITableViewDataSource
extension OrdinalViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,  forIndexPath:indexPath)
        
        let ordinalString = numberFormatter.stringFromNumber((indexPath.row + 1))
        
        cell.textLabel?.text = ordinalString
        
        return cell
    }
}

