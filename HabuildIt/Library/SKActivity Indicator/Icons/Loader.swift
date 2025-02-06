//
//  Loader.swift
//  Verkoop
//
//  Created by Vijay's Macbook on 15/11/18.
//  Copyright © 2018 MobileCoderz. All rights reserved.
//

import UIKit
class Loader {
    
    class func show(message: String = "") {
        SKActivityIndicator.spinnerStyle(.spinningFadeCircle)
        SKActivityIndicator.spinnerColor(Constants.Color.loginButtonGradiantEnd!)
        SKActivityIndicator.show(message, userInteractionStatus: false)
    }
    
    class func hide() {
        SKActivityIndicator.dismiss()
    }
    
}
