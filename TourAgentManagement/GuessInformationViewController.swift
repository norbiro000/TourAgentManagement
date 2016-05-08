//
//  GuessInformationViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/8/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import TextFieldEffects

class GuessInformationViewController: UIViewController {

    @IBOutlet weak var tf_guessName: JiroTextField!
    @IBOutlet weak var tf_guessPhoneNumber: JiroTextField!
    @IBOutlet weak var tf_guessEmail: JiroTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        if parent == nil {
//            VoucherBuilder.Building.guessAmount.removeLast()
        }
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
        VoucherBuilder.Building.email = tf_guessEmail.text
        VoucherBuilder.Building.name = tf_guessName.text
        VoucherBuilder.Building.telephoneNumber = tf_guessPhoneNumber.text
        
        
        print(VoucherBuilder.Building.email)
        print(VoucherBuilder.Building.name)
        print(VoucherBuilder.Building.telephoneNumber)
        
        performSegueWithIdentifier("setTImeSegue", sender: nil)
    }
}
