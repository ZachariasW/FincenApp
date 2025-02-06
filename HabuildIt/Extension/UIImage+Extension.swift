//
//  UIImage+Extension.swift
//  HabuildIt
//
//  Created by Vivek Singh on 01/11/23.
//

import Foundation
import UIKit
extension UIImage {
  var asJPEGData: Data? {
    //    self.jpegData(compressionQuality: 1)
    return self.jpegData(compressionQuality: 1)   // QUALITY min = 0 / max = 1
  }
  var asPNGData: Data? {
    return self.pngData()
  }
    
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = bounds
            gradientLayer.colors = colors

            UIGraphicsBeginImageContext(gradientLayer.bounds.size)
            gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image!
        }
}
