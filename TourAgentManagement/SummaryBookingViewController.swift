//
//  SummaryBookingViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/8/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit

class SummaryBookingViewController: UIViewController {

    @IBOutlet weak var lb_guessName: UILabel!
    @IBOutlet weak var lb_telNumber: UILabel!
    @IBOutlet weak var lb_guessEmail: UILabel!
    
    @IBOutlet weak var lb_serviceName: UILabel!
    @IBOutlet weak var lb_amont: UILabel!
    @IBOutlet weak var lb_timeToVisit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    
        let building:VoucherBuilder = VoucherBuilder.Building
        
        lb_guessName.text = building.name!
        lb_telNumber.text = building.telephoneNumber!
        lb_guessEmail.text = building.email!
        
        lb_serviceName.text = building.tourProgram
        
        var amontString = ""
        for voucher in building.guessAmount!{
            amontString += "\(voucher["tag"]!):\(voucher["amonut"]!)"
            if voucher != building.guessAmount!.last!{
                amontString += ", "
            }
        }
        
        lb_amont.text = amontString
        
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = dateFormatter.stringFromDate(building.timeToVisit!)
        
        
        lb_timeToVisit.text = strDate
        
        
        
        
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
    
    @IBAction func onFinish(sender: AnyObject) {
        
        VoucherBuilder.Building.remark = "s"
        VoucherBuilder.Building.debugBuilding()
        
        let vocher:Voucher = Voucher(builder: VoucherBuilder.Building)!
        
        VoucherBuilder.Building.send()
    }

}
