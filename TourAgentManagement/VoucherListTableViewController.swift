//
//  VoucherListTableViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/9/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

enum CustomerState{
    case BOOKING
    case WAITPAYMENT
    case CONFIRMPAYMENT
    case FINISH
    case NONE
}


class VoucherListTableViewController: UITableViewController ,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource{
    
    
    var dataSource:[JSON] = []
    
    var state:CustomerState = .NONE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        self.tableView.tableFooterView = UIView()
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
        
        
        cell.lb_title.text = dataSource[indexPath.row]["datas"]["guessName"].stringValue
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch state{
        case .BOOKING:
            break
        case .WAITPAYMENT:
            performSegueWithIdentifier("paymentSegue", sender: indexPath)
        default:
            break
            
        }
        
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "" {
            let destination:MyCustomerTableViewController = segue.destinationViewController as! MyCustomerTableViewController
        }
        if segue.identifier == "paymentSegue" {
            let indexPath = sender as! NSIndexPath
            let destination: PaymentViewController = segue.destinationViewController as! PaymentViewController
            
            destination.voucher_id = dataSource[indexPath.row]["_id"].stringValue
        }
        
    }
    
    
    
    
    
}


extension VoucherListTableViewController{
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Haven't any Voucher"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "taylor-swift")
    }
    
    //    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
    //        let str = "Add Grokkleglob"
    //        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleCallout)]
    //        return NSAttributedString(string: str, attributes: attrs)
    //    }
    //
    //    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
    //        let ac = UIAlertController(title: "Button tapped!", message: nil, preferredStyle: .Alert)
    //        ac.addAction(UIAlertAction(title: "Hurray", style: .Default, handler: nil))
    //        presentViewController(ac, animated: true, completion: nil)
    //    }
}


