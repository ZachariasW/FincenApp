//
//  CommonUtils.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation
import UIKit

class CommonUtils {
//    class  func redirect(){
//        DisplayBanner.show(message: "Your session is timeout, please login again.")
//        logOutUser()
//    }

    class func logOutUser() {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
        logoutData()
    }
    class func logoutData() {
       
       
        if let rootNC = kAppDelegate.window?.rootViewController as? UINavigationController {
            let vc = CMLoginVC.instantiate(fromAppStoryboard: .registration)
            var viewControllers = rootNC.viewControllers
            viewControllers.insert(vc, at: 0)
            rootNC.viewControllers = viewControllers
            rootNC.popToRootViewController(animated: true)
            
        }
       
    }
}

