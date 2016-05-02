//
//  APIFacade.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/2/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation
import Alamofire


class Service {
    
    let host="http://localhost:8080"
    
    static let shareService = Service()
    
    func getMyInformation(completion: (JSON)->() ){
        Alamofire.request(.GET, host+"/api/myInformation/"+User.shareInstance.token)
            .response { request, response, data, error in
                let json = JSON(data : data!)
                completion(json)
        }
        
    }
    
    
    
    func saveMyInformation(params : [String:String]) {
        Alamofire.request(.POST,host+"/api/saveInformation/"+User.shareInstance.token, parameters: params)
            .response { request, response, data, err in
                
        }
        
    }
}