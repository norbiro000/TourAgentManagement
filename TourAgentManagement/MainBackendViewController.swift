//
//  MainBackendViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class MainBackendViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = [["My Information"],["Operator List","My Operator"],["My Customer"]]
    
    let sectionTitle = ["My Information","Operator","Customer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
         self.tableView.tableFooterView = UIView()
        
        
    }

    
    override func viewDidAppear(animated: Bool) {
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.whiteColor()
        MyColor.darkGreenColor()
        nav?.barTintColor = MyColor.darkGreenColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("mainBackendCell") as! MainBackendTableViewCell
        
        cell.title.text = dataSource[indexPath.section][indexPath.row]

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.section){
        case 0:
            if indexPath.row == 0{
                //Go to My Information
                performSegueWithIdentifier("myInformationSegue", sender: nil)
            }
        case 1:
            if indexPath.row == 0{
                //Go to My Information
                performSegueWithIdentifier("operatorListSegue", sender: nil)
            }
            if indexPath.row == 1{
                performSegueWithIdentifier("myOperatorSegue", sender: nil)
            }
            
        case 2:
            if indexPath.row == 0{
                performSegueWithIdentifier("myCustomerSegue", sender: nil)
            }
        default:break
        }
        
    }
}

extension MainBackendViewController{
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "You Haven't any Brochure"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Please check your partner on backend setting."
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
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


