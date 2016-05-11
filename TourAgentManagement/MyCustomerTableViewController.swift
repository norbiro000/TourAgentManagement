//
//  MyCustomerTableViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/9/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit

class MyCustomerTableViewController: UITableViewController {
    
    var dataSource = ["Booking","Wait Payment","Verifying Payment","End Trancestion"]
    
    var json:JSON?
    
    var booking:[JSON] = []
    var waitPayment:[JSON] = []
    var ConfirmPayment:[JSON] = []
    var finish:[JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MyCustomerTableViewCell
        
        
        cell.lb_title.text = dataSource[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showVoucher", sender: indexPath)
    }
    

    
    
    func loadData(){
        Service.shareService.getMyVoucher { (JSON) in
            for (key, subJson) in JSON {
                
                if subJson["state"].stringValue == "0"{
                    self.booking.append(subJson)
                }else if  subJson["state"].stringValue == "1"{
                    self.waitPayment.append(subJson)
                }else if subJson["state"].stringValue == "2"{
                    self.ConfirmPayment.append(subJson)
                }else if subJson["state"].stringValue == "3"{
                    self.finish.append(subJson)
                }else{
                    
                }
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let indexPath = sender as! NSIndexPath
        let destination:VoucherListTableViewController = segue.destinationViewController as! VoucherListTableViewController
        switch(indexPath.row){
        case 0:
            print(booking)
            destination.dataSource = booking
            destination.state = CustomerState.BOOKING
        case 1:
            print(waitPayment)
            destination.dataSource = waitPayment
            destination.state = CustomerState.WAITPAYMENT
        case 2:
            print(ConfirmPayment)
            destination.dataSource = ConfirmPayment
            destination.state = CustomerState.CONFIRMPAYMENT
        case 3:
            print(finish)
            destination.dataSource = finish
            destination.state = CustomerState.FINISH
        default: break
        }
        
    }
    

}
