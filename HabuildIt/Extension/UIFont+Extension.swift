//
//  UIFont+Extension.swift
//  WeekInChina
//
//  Created by Vikas Sachan on 12/04/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//

import UIKit

extension UIFont {
    class func printFontFamily(){
        for family in UIFont.familyNames {
            print("Family \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("Members----\(name)")
            }
        }
    }
    
    static func kAppDefaultFontBold(ofSize size: CGFloat = 16) -> UIFont {
        let widthFactor: CGFloat = kScreenWidth / 320
        return UIFont(name: "Avenir-Black", size: size * widthFactor)!
        
    }
    
    static func kAppDefaultFontRegular(ofSize size: CGFloat = 16) -> UIFont {
        let widthFactor: CGFloat = kScreenWidth / 320
        return UIFont(name: "Avenir-Medium", size: size * widthFactor)!
    }
    
    static func kAppDefaultFontHeavy(ofSize size: CGFloat = 16) -> UIFont {
        let widthFactor: CGFloat = kScreenWidth / 320
        return UIFont(name: "Avenir-Heavy", size: size * widthFactor)!
    }
}

