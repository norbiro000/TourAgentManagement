//
//  PaymentViewController.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/10/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import UIKit
import Alamofire
import TextFieldEffects

class PaymentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var tf_amount: JiroTextField!
    @IBOutlet weak var dp_datepay: UIDatePicker!
    
    var imagePicker = UIImagePickerController()
    
    var voucher_id = ""
    
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onUpload(sender: AnyObject) {
        let URL = "http://localhost:8080/upload"
        
        
    }

    @IBAction func onSelectImage(sender: AnyObject) {
        
        imagePicker.sourceType = .PhotoLibrary
        
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image.contentMode = .ScaleAspectFit
            image.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
    
    func successDataHandler(responseData:String){
        
        print ("IMAGE UPLOAD SUCCESSFUL    !!!")
        
    }
    
    func failureDataHandler(errorData:String){
        
        print ("  !!!   IMAGE UPLOAD FAILURE   !!! ")
        
    }
    
    
    func uplaodImageData(RequestURL: String,postData:[String:AnyObject]?,successHandler: (String) -> (),failureHandler: (String) -> ()) -> () {
        
        let headerData:[String : String] = ["Content-Type":"application/json"]
        
        Alamofire.request(.POST,RequestURL, parameters: postData, encoding: .URLEncodedInURL, headers: headerData).responseString{ response in
            switch response.result {
            case .Success:
                print(response.response?.statusCode)
                successHandler(response.result.value!)
            case .Failure(let error):
                failureHandler("\(error)")
            }
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

    @IBAction func onPayment(sender: AnyObject) {
        var refreshAlert = UIAlertController(title: "Confirm", message: "All data will be lost.", preferredStyle: UIAlertControllerStyle.Alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
            
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            formatter.timeStyle = .MediumStyle
            
            let dateString = formatter.stringFromDate(self.dp_datepay.date)
            
            
            let param: [String: AnyObject] = [
                "voucher_id": self.voucher_id,
                "payment_information": [
                    "payment_date": "\(dateString)",
                    "total": "\(self.tf_amount.text!)",
                ],
            ]
            
            
            Service.shareService.payment(param) {
                if let navController = self.navigationController {
                    navController.popViewControllerAnimated(false)
                    navController.popViewControllerAnimated(false)
                    navController.popViewControllerAnimated(true)
                }
            }
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
            
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
        
        
    }
}
