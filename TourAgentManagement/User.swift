//
//  User.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation

struct UserDetail{
    var token:String
    init(token:String){
        self.token = token
    }
}

class User{
    static let shareInstance = User()
    var token=String()
    private init(){
        func test(){
            print("yow")
        }
    }
    
    func test(){
        print("Yow Ar siam")
    }

}



