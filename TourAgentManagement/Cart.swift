//
//  Cart.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/6/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation

class Cart {
    private static var instance = Cart()
    
    static func getInstance() -> Cart{
        return self.instance
    }
    
    var vouchers = [Voucher]()
    
    private init(){}
    
    func addToCart(voucher:Voucher){
        vouchers.append(voucher)
    }
    
    func getItemInCart() -> [Voucher]{
        return vouchers
    }
    
    func removeItem(index:Int){
        do{
            try self.vouchers.removeAtIndex(index)
        }catch _ {
            print("EROE")
        }
    }
    
    
}
