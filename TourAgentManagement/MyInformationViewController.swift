//
//  MyInformationViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class MyInformationViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate, EditMyInformationDelegate{
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var imageUrl = "ic_phone"
    var dataSource = JSON?()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleImage.layer.borderWidth = 2
        titleImage.layer.masksToBounds = false
        titleImage.layer.borderColor = UIColor.whiteColor().CGColor
        titleImage.layer.cornerRadius = titleImage.frame.height/1.5
        titleImage.clipsToBounds = true
        
        //Set Table delegate and datasource
        tableView.dataSource = self
        tableView.delegate = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
    
        
        self.tableView.tableFooterView = UIView()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = self.dataSource{
            return data.count
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myInformationCell") as! MyInformationTableViewCell
        
        switch(indexPath.row){
        case 0:
            if dataSource!["telephone"].stringValue != ""{
                cell.cellImage.image = UIImage(named: "ic_phone")
                cell.cellText.text = self.dataSource!["telephone"].stringValue
            }
        case 1:
            if dataSource!["fax"].stringValue != ""{
                cell.cellImage.image = UIImage(named: "ic_fax")
                cell.cellText.text = self.dataSource!["fax"].stringValue
            }
        case 2:
            if dataSource!["email"].stringValue != ""{
                cell.cellImage.image = UIImage(named: "ic_mail_outline")
                cell.cellText.text = self.dataSource!["email"].stringValue
            }
        case 3:
            if dataSource!["province"].stringValue != ""{
                cell.cellImage.image = UIImage(named: "ic_province")
                cell.cellText.text = self.dataSource!["province"].stringValue
            }
        case 4:
            if dataSource!["address"].stringValue != ""{
                cell.cellImage.image = UIImage(named: "ic_pin_drop")
                cell.cellText.text = self.dataSource!["address"].stringValue
            }
        default:
            break
        }
    
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let edit = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "EDIT"){(UITableViewRowAction,NSIndexPath) -> Void in
            self.performSegueWithIdentifier("editInformation", sender: indexPath)
        }
        
        edit.backgroundColor = UIColor.blackColor()
        return [edit]
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "editInformation"{
            let indexPath = sender as! NSIndexPath
            let destination:EditInformationViewController = segue.destinationViewController as! EditInformationViewController
            print(indexPath.row)
            
            //Set delegate to subview
            destination.delegate = self
            
            switch(indexPath.row){
            case 0:
                destination.placehoderTitle = "Telephone Number"
                destination.oldValue = self.dataSource!["telephone"].stringValue
                destination.jsonKey = "telephone"
                
            case 1:
                destination.placehoderTitle = "Fax"
                destination.oldValue = self.dataSource!["fax"].stringValue
                destination.jsonKey = "fax"
            case 2:
                destination.placehoderTitle = "Email"
                destination.oldValue = self.dataSource!["email"].stringValue
                destination.jsonKey = "email"
            case 3:
                destination.placehoderTitle = "Province"
                destination.oldValue = self.dataSource!["province"].stringValue
                destination.jsonKey = "province"
            case 4:
                destination.placehoderTitle = "Address"
                destination.oldValue = self.dataSource!["address"].stringValue
                destination.jsonKey = "address"
            default:break
            }
    }
        
        
    }
    
    func success() {
        loadData()
        tableView.reloadData()
    }
    
    func loadData() {
        let json = Service.shareService.getMyInformation(self) { (JSON) in
            self.dataSource = JSON
            self.tableView.reloadData()
        }
    }
    

}

extension MyInformationViewController{
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "You Haven't any Information"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Please add your information."
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "taylor-swift")
    }
    
        func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
            let str = "Add Information"
            let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleCallout)]
            return NSAttributedString(string: str, attributes: attrs)
        }
    
        func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
            performSegueWithIdentifier("addInformationSegue", sender: nil)
        }
}



