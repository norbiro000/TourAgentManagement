//
//  InternetCheck.swift
//  TourAgentManagement
//
//  Created by Jakkapan Thongkum on 5/4/2559 BE.
//  Copyright © 2559 Jakkapan Thongkum. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

public class Reachability {
    class func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    class func isConnectedToNetwork(context:UIViewController) -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        if !(isReachable && !needsConnection){
         Reachability.alert(context)
        }
        
        return (isReachable && !needsConnection)
    }
    
    class func alert(context:UIViewController){
        var requestAlert = UIAlertController(title: "Error", message: "Please check your internet connection.", preferredStyle: UIAlertControllerStyle.Alert)

        requestAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
//            print("Handle Cancel Logic here")
        }))
        
        context.presentViewController(requestAlert, animated: true, completion: nil)

    }
}