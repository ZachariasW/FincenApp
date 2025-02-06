//
//  DisplayBanner.swift
//  CircleOnlineMarketing
//
//  Created by User on 20/02/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//

import Foundation
import NotificationBannerSwift
class DisplayBanner {
    
    class func successBanner(message: String) {
        DispatchQueue.main.async {
//            TWMessageBarManager.sharedInstance().hideAll()
//            TWMessageBarManager.sharedInstance().showMessage(withTitle: "Success", description: message, type: .success, duration: 1.5, statusBarHidden: false, callback: nil)
            
            let banner = GrowingNotificationBanner(title: "Success", subtitle: message, style: .success)
            banner.duration = 1.5
            banner.autoDismiss = true
            banner.show()
        }
    }
    
    class func failureBanner(message: String) {
        DispatchQueue.main.async {
//            TWMessageBarManager.sharedInstance().hideAll()
//            TWMessageBarManager.sharedInstance().showMessage(withTitle: "Error", description: message, type: .error, duration: 1.5, statusBarHidden: false, callback: nil)
            let banner = GrowingNotificationBanner(title: "Error", subtitle: message, style: .danger)
            banner.duration = 1.5
            banner.autoDismiss = true
            banner.show()
        }
    }
    
    class func infoBanner(message: String) {
        DispatchQueue.main.async {
//            TWMessageBarManager.sharedInstance().hideAll()
//            TWMessageBarManager.sharedInstance().showMessage(withTitle: "Info", description: message, type: .info, duration: 1.5, statusBarHidden: false, callback: nil)
            let banner = GrowingNotificationBanner(title: "Info", subtitle: message, style: .info)
            banner.duration = 1.5
            banner.autoDismiss = true
            banner.show()
        }
    }
    class func infonBanner(message: String) {
        DispatchQueue.main.async {
            TWMessageBarManager.sharedInstance().hideAll()
            TWMessageBarManager.sharedInstance().showMessage(withTitle: "Info", description: message, type: .info, duration: 4, statusBarHidden: false, callback: nil)
        }
    }

}
