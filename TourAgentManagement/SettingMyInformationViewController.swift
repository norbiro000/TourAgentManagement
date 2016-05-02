//
//  SettingMyInformationViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import TextFieldEffects

class SettingMyInformationViewController: UIViewController {
    @IBOutlet weak var tf_telNumber: JiroTextField!
    @IBOutlet weak var tf_email: JiroTextField!
    @IBOutlet weak var tf_fax: JiroTextField!
    @IBOutlet weak var tf_province: JiroTextField!
    @IBOutlet weak var tf_address: JiroTextField!
    
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

    @IBAction func onSave(sender: AnyObject) {
        let parameter = [
            "telephone":tf_telNumber.text!,
            "email":tf_email.text!,
            "fax":tf_fax.text!,
            "province":tf_province.text!,
            "address":tf_address.text!,
            
            
        ]
        Service.shareService.saveMyInformation(parameter)
    }
}
