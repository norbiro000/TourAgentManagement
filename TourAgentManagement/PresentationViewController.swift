//
//  PresentationViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/5/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class PresentationViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    
    var dataSource:JSON = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        
        tableView.tableFooterView = UIView()
        
        reloadData()
        
    }
    
    
    func reloadData(){
        Service.shareService.getMyService { (JSON) in
            print(JSON)
            self.dataSource = JSON
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("presentationCell") as! PresentaionTableViewCell
        
        cell.img_background.image = UIImage(named: "tigerkingdom2")
        cell.lb_title.text = self.dataSource[indexPath.row]["content"]["service_name"].stringValue

        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let indexPath = sender as! NSIndexPath
        let destination : DetailPresentationViewController = segue.destinationViewController as! DetailPresentationViewController
        
        destination.dataSource = self.dataSource[indexPath.row]
        destination.title = self.dataSource[indexPath.row]["content"]["service_name"].stringValue
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetailSugea", sender: indexPath)
    }

}



extension PresentationViewController{
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "You Haven't any Brochur"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Please Check your internet connection."
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "taylor-swift")
    }
}
