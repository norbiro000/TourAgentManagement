//
//  SetTimeToBookingViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/8/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit

class SetTimeToBookingViewController: UIViewController {

    @IBOutlet weak var dp_dateTime: UIDatePicker!
    
    
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
    
    @IBAction func onNext(sender: AnyObject) {
        VoucherBuilder.Building.timeToVisit = dp_dateTime.date
        performSegueWithIdentifier("selectTranferSegue", sender: nil)
    }
}
