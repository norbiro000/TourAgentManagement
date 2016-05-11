//
//  Voucher.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/6/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation


struct Voucher{
    var service_id:String?
    var operator_email:String?
    var tourProgram:String?
    
    var timeToVisit:NSDate?
//    var meetPoint:String?
    
    var name:String?
    var telephoneNumber:String?
    var email:String?
    
    var guessAmount:[[String: String]]?
    
    var remark:String?
    
    init(){
        
    }
    
    init?(builder: VoucherBuilder) {
        
        if let service_id = builder.service_id, operator_email = builder.operator_email, tourProgram = builder.tourProgram ,timeToVisit = builder.timeToVisit, name = builder.name , telephoneNumber = builder.telephoneNumber, email = builder.email, guessAmount = builder.guessAmount, remark = builder.remark
        {
            self.service_id = service_id
            self.operator_email = operator_email
            self.tourProgram = tourProgram
            self.timeToVisit = timeToVisit
//            self.meetPoint = meetPoint
            self.name = name
            self.telephoneNumber = telephoneNumber
            self.email = email
            self.guessAmount = guessAmount
            self.remark = remark
        } else {
            return nil
        }
    }
    
}

class VoucherBuilder {
    static var Building = VoucherBuilder()

    var service_id:String?
    var operator_email:String?
    var tourProgram:String?
    
    var timeToVisit:NSDate?
    var meetPoint:String?

    var price:String?
//    var tagPrice:String?
    
    var name:String?
    var telephoneNumber:String?
    var email:String?
    
//    var amountOfGuess:Int?
    
    var guessAmount:[[String: String]]?
    
    var remark:String?
    
    var currentJSON: JSON?
    
    typealias BuilderClosure = (VoucherBuilder) -> ()
    
    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
    
    init(){}
    
    
    func newVoucher(operator_email:String, service_id:String, tourProgram:String){
        self.operator_email = operator_email
        self.service_id = service_id
        self.tourProgram = tourProgram
        
        self.timeToVisit = nil
        self.meetPoint = nil
        
//        self.tagPrice = nil
        self.price = nil
        
        
        self.name = nil
        self.telephoneNumber = nil
        self.email = nil
        
        //    var amountOfGuess:Int?
        
        self.guessAmount = []
        
        self.remark = nil
        
        self.currentJSON = nil
    }
    
    
    
    func getVoucher() ->VoucherBuilder{
        return self
    }
    
    func debugBuilding(){
        print("\(self.operator_email)\n")
        print("\(self.service_id)\n")
        print("\(self.tourProgram)\n")
        print("\(self.timeToVisit)\n")
        print("\(self.meetPoint)\n")
        print("\(self.price)\n")
        print("\(self.name)\n")
        print("\(self.telephoneNumber)\n")
        print("\(self.email)\n")
        print("\(self.guessAmount)\n")
        print("\(self.remark)\n")
        
    }
    
    func send(contact: SummaryBookingViewController){
        
        
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.LongStyle
            formatter.timeStyle = .ShortStyle
            
            let dateString = formatter.stringFromDate(self.timeToVisit!)
        
        var amontString = ""
        for voucher in self.guessAmount!{
            amontString += "\(voucher["tag"]!):\(voucher["amonut"]!)"
            if voucher != self.guessAmount!.last!{
                amontString += ", "
            }
        }
        

        
        let param: [String: AnyObject] = [
            "operator_email": self.operator_email!,
            "datas": [
                "tourProgram": "\(self.tourProgram!)",
                "guessName": "\(self.name!)",
                "numberOfGuess": "\(amontString)",
                "meetingPoint": "\(self.meetPoint!)",
                "time": "\(dateString)",
                "remark": "\(self.remark!)"
            ],
            ]
        
        Service.shareService.booking(param) {
            if let navController = contact.navigationController {
                for index in 1...7{
                    navController.popViewControllerAnimated(false)
                }
            }
        }
        
    }

}


