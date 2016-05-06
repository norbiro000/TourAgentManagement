//
//  BookingFactory.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/6/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation


enum BookingType{
    case Personal
    case Group
}

protocol Booking {
    func booking(service_name:String ,email:String)
    func clear()
}


class PersonalBooking : Booking{
    func booking(service_name:String ,email:String) {
        var voucher = Voucher()
    }
    
    func clear() {
        
    }
}


class GroupBooking : Booking{
    func booking(service_name:String ,email:String) {
        
    }
    
    func clear() {
        
    }
    
    
}

class BookingFactory{
    func BookingFactory(type:BookingType) -> Booking?{
        if type == .Personal{
            return PersonalBooking()
        }
        if type == .Group{
            return GroupBooking()
        }
        return nil
    }
}