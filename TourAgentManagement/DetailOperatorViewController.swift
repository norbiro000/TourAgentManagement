//
//  DetailOperatorViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/3/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import DZNEmptyDataSet


class DetailOperatorViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetDelegate,DZNEmptyDataSetSource{
    
    var dataSource:JSON = []
    var textTitle:String = ""
    var operator_id = ""
    
    
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_address: UILabel!
    @IBOutlet weak var img_logo: UIImageView!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        self.tableView.tableFooterView = UIView()
        
        
        img_logo.layer.borderWidth = 2
        img_logo.layer.masksToBounds = false
        img_logo.layer.borderColor = UIColor.whiteColor().CGColor
        img_logo.layer.cornerRadius = img_logo.frame.height/1.5
        img_logo.clipsToBounds = true

        self.operator_id = dataSource["_id"].stringValue
        self.lb_title.text = dataSource["companyName"].stringValue
        self.lb_address.text = dataSource["address"]["address"].stringValue
        print(dataSource)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource["address"].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("operatorListCell") as! DetailOperatorListTableViewCell
        
        print(">>"+dataSource["address"]["email"].stringValue+"<<")
       
        switch(indexPath.row){
        case 0:
            if dataSource["address"]["telephone"].stringValue != ""{
                cell.img_logo.image = UIImage(named: "ic_phone")
                cell.lb_title.text = dataSource["address"]["telephone"].stringValue
            }
        case 1:
            if dataSource["address"]["fax"].stringValue != ""{
                cell.img_logo.image = UIImage(named: "ic_fax")
                cell.lb_title.text = self.dataSource["address"]["fax"].stringValue
            }
        case 2:
            if dataSource["address"]["email"].stringValue != ""{
                cell.img_logo.image = UIImage(named: "ic_mail_outline")
                cell.lb_title.text = self.dataSource["address"]["email"].stringValue
            }
        case 3:
            if dataSource["address"]["province"].stringValue != ""{
                cell.img_logo.image = UIImage(named: "ic_province")
                cell.lb_title.text = self.dataSource["address"]["province"].stringValue
            }
        case 4:
            if dataSource["address"]["address"].stringValue != ""{
                cell.img_logo.image = UIImage(named: "ic_pin_drop")
                cell.lb_title.text = self.dataSource["address"]["address"].stringValue
            }
        default:
            break
        }
        
        
        return cell
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onContact(sender: AnyObject) {
        var requestAlert = UIAlertController(title: "Send Contact", message: "Do you want to work with this operator", preferredStyle: UIAlertControllerStyle.Alert)
        
        requestAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
            
            let param = ["to_id": self.operator_id]
            print(param)
            Service.shareService.sendRequestAddPartner(param)
        }))
        
        requestAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        presentViewController(requestAlert, animated: true, completion: nil)
    }
}

extension DetailOperatorViewController{
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Haven't any information to show"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "This operator didn't insert it."
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
}




