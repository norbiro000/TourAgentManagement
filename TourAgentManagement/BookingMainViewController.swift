
//
//  BookingMainViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/6/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class BookingMainViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    
    var dataSet = ["Personal", "Group"]
    var dataSource:JSON = []
    var state = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        self.title = "Booking Type"
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "selectPriceSegue"{
        let indexPath = sender as! NSIndexPath
        
        let destination:SetPriceTableViewController = segue.destinationViewController as! SetPriceTableViewController
        
        destination.dataSource = self.dataSource
        if state == 1 {
            destination.state = self.state
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            performSegueWithIdentifier("selectPriceSegue", sender: indexPath)
        }
        if indexPath.row == 1{
            self.state = 1
            performSegueWithIdentifier("selectPriceSegue", sender: indexPath)
        }
    }
 

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSet.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("typeBookingCell") as! BookingTableViewCell
        cell.lb_title.text = dataSet[indexPath.row]
        return cell
    }
}
