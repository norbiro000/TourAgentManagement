//
//  LoginViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/1/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire


class LoginViewController: UIViewController {

    @IBOutlet weak var tf_email: JiroTextField!
    @IBOutlet weak var tf_password: JiroTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        tf_email.placeholderColor =
        
        
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
    
    
    @IBAction func onInputEmail(sender: AnyObject) {
        
        // For Validate Email is Real Email
        if let user = tf_email.text{
            if !user.isEmailValid{
                // If Wrong format Email
                tf_email.backgroundColor = .redColor()
                tf_email.placeholderColor = .whiteColor()
                tf_email.textColor = .whiteColor()
            }else{
                // If True format Email
                tf_email.backgroundColor = .whiteColor()
                tf_email.placeholderColor = .grayColor()
                tf_email.textColor = .blackColor()
            }
        }
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        var username:String
        var password:String
        
        if let user = tf_email.text{
            if !user.isEmailValid{
                tf_email.backgroundColor = .redColor()
                tf_email.placeholderColor = .whiteColor()
                tf_email.textColor = .whiteColor()
                return
            }
            username = user
        }else{
            return
        }
        
        if let pass = tf_password.text{
            password = pass
        }else{
            return
        }
        
        let parammeters = [
            "email":username,
            "password":password
        ]
        
        
        Alamofire.request(.POST, "http://localhost:8080/loginM", parameters: parammeters)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                //   1
                switch response.result{
                //   2
                case .Success:
                    //   3
                    let json = JSON(data: response.data!)
                    let loginStatus = json["loginStatus"].numberValue
                    let loginMessage = json["loginMessage"].stringValue
                    
                    if loginStatus == 1{
                        // Login Success
                        let token = json["token"].stringValue
                        
                        
                        //Set Token Data to Memory
                        User.shareInstance.token = token
                        
                        for view in self.view.subviews {
                            view.removeFromSuperview()
                        }
                        
                        User.shareInstance.test()
                        
                        
                        
                        
                        //perform to next page
                        self.performSegueWithIdentifier("mainPageSegue", sender: nil)
                        
                        
                    }else{
                        // Login Fail
                        self.showModal(loginMessage)
                    }
                    
                //   2
                case .Failure(let error):
                    //   3
                    if Reachability.isConnectedToNetwork(){
                        //Server Error
                        self.showModal("Server Busy")
                    }else{
                        //Internet Is not Connecting
                        self.showModal("Login Fail \nPlease Check your internet Connection")
                    }
                }
                    
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
        }
    }
    
    func showModal(message:String) {
        var refreshAlert = UIAlertView()
        refreshAlert.title = "\(message)"
        refreshAlert.addButtonWithTitle("OK")
        refreshAlert.show()
    }
    

}


extension String {
    var isEmailValid: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", options: .CaseInsensitive)
            return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
}