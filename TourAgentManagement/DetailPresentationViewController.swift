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
    @IBOutlet weak var lb_price: UILabel!

    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_des: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.lb_title.text = dataSource["content"]["service_name"].stringValue
        self.lb_des.text = dataSource["content"]["description"].stringValue
        print(dataSource)
        
        var price = ""
        
        for item in dataSource["price"]{
            price += "\(item.1["tag"].stringValue) : \(item.1["maxprice"].stringValue)"
        }
        
        self.lb_price.text = price
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
        let destinaiton: BookingMainViewController =  segue.destinationViewController as! BookingMainViewController
        
        //Set Data for Singleton data
        VoucherBuilder.Building.currentJSON = self.dataSource
        
        destinaiton.dataSource = self.dataSource
    }
    

    @IBAction func onTakeTrip(sender: AnyObject) {
        
        let operator_id = dataSource["email"].stringValue
        let service_id = dataSource["_id"].stringValue
        let tourProgram = dataSource["content"]["service_name"].stringValue
        
        VoucherBuilder.Building.newVoucher(operator_id, service_id: service_id, tourProgram: tourProgram)
        
        performSegueWithIdentifier("setVoucherSugue", sender: nil)
        
    }
}
