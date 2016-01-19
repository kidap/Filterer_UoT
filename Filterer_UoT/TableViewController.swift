//
//  TableViewController.swift
//  Filterer_UoT
//
//  Created by Karlo Pagtakhan on 01/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    let filters = [
        "Red",
        "Blue",
        "Green",
        "Yellow",
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = filters[indexPath.row]
        
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print(filters[indexPath.row])
        
    }
    

}
