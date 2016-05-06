//
//  APIFacade.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


class Service {
    
    let host="http://localhost:8080"
    
    static let shareService = Service()
    
    func getMyInformation(context: UIViewController ,completion: (JSON)->() ){
//        if Reachability.isConnectedToNetwork(context){
            Alamofire.request(.GET, host+"/api/myInformation/"+User.shareInstance.token)
                .response { request, response, data, error in
                    if let data = data{
                        let json = JSON(data : data)
                        completion(json)
                    }
            }
//        }
        
    }
    
    func saveMyInformation(params : [String:String], completion: ()->()) {
        Alamofire.request(.POST, host+"/api/saveInformation/"+User.shareInstance.token, parameters: params)
            .response { request, response, data, err in
                completion()
        }
        
    }
    
    func getOperatorList(completion: (JSON)->()){
        Alamofire.request(.GET, host+"/api/getOperator/"+User.shareInstance.token)
            .response { request, response, data, err in
                if let data = data{
                    let json = JSON(data: data)
                    completion(json)
                }
        }
    }
    
    func getMyOperatorList(completion: (JSON)->()){
        Alamofire.request(.GET, host+"/api/getMyOperator/"+User.shareInstance.token)
            .response { request, response, data, err in
                if let data = data{
                    let json = JSON(data: data)
                    completion(json)
                }
        }
    }
    
    func getMyService(completion: (JSON)->()){
        Alamofire.request(.GET, host+"/api/myService/"+User.shareInstance.token)
            .response { request, response, data, err in
                if let data = data{
                    let json = JSON(data: data)
                    completion(json)
                }
        }
    }
    
    func sendRequestAddPartner(params:[String:String]){
        Alamofire.request(.POST, host+"/api/addPartner/"+User.shareInstance.token, parameters: params)
            .response { request, response, data, err in
                
                print("send")
//                if let data = data{
//                    let json = JSON(data: data)
                    
//                }
        }
    }
    
}