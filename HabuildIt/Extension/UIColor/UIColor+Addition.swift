//
//  UIColor+Addition.swift
//  WeekInChina
//
//  Created by Kanika Mishra on 08/03/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
            let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int = UInt64()
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        }
    
    var hexString: String {
        let components = self.cgColor.components
        let red = Float(components![0])
        let green = Float(components![1])
        let blue = Float(components![2])
        return String(format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
    }
    class func getRGBColor(_ r:CGFloat,g:CGFloat,b:CGFloat)-> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
}
extension UITextField {
    func applyLeftPadding(padding: Int) {
        let paddingView = UIView.init(frame: CGRect(x: 0,y:0,width: padding,height: Int(self.frame.size.height)))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
