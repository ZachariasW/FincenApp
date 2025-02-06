//
//  UIApplication+Extension.swift
//  WeekInChina
//
//  Created by Vikas Sachan on 05/04/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//

import UIKit
extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
