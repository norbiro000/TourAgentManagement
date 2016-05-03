//
//  EditInformationViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import TextFieldEffects

protocol EditMyInformationDelegate {
    func success()
}

class EditInformationViewController: UIViewController{
    
    var placehoderTitle:String  = ""
    var oldValue:String = ""
    var jsonKey:String = ""
    
    var delegate:EditMyInformationDelegate?
    
    
    @IBOutlet weak var tf_value: JiroTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tf_value.placeholder = placehoderTitle
        tf_value.text = oldValue
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
        let params = [
            jsonKey: tf_value.text!
        ]
        
        Service.shareService.saveMyInformation(params){
            self.dismissViewControllerAnimated(true) {
                self.delegate?.success()
            }
        }
    }
    
    
    @IBAction func onClose(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { 
            
        }
    }
}
