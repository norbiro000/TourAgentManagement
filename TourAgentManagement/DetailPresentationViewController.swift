//
//  DetailPresentationViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/7/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit

class DetailPresentationViewController: UIViewController {
    
    var dataSource:JSON = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func onTakeTrip(sender: AnyObject) {
        performSegueWithIdentifier("setVoucherSugue", sender: nil)
    }
}
