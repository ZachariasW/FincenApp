//
//  UIView+Extension.swift
//  WeekInChina
//
//  Created by Vikas Sachan on 05/04/19.
//  Copyright © 2019 MobileCoderz. All rights reserved.
//

import UIKit
extension UIView{
    func makeRounded() {
        self.layer.cornerRadius = self.frame.size.width/2.0
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeRoundCorner(_ radius:CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true

    }
    func makeRoundCornerDefault(){
        self.layer.cornerRadius = self.layer.cornerRadius / 2
        self.clipsToBounds = true
    }
    
    func makeBorder(_ width:CGFloat,color:UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
    
   
    
    func addShadowWithRadius(radius: CGFloat ,cornerRadius: CGFloat ){
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
    }
    func addButtonShadowWithRadius(radius: CGFloat ,cornerRadius: CGFloat  , color : UIColor){
         layer.shadowColor = color.cgColor
                 layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.4
               layer.shadowRadius =  radius
            layer.masksToBounds = false
            layer.cornerRadius = cornerRadius
    }
   
    func setShadowWithColor() {
      //  layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0 ,height: 2)
        self.layer.shadowRadius = 5
        self.layer.borderColor = UIColor.clear.cgColor
         layer.cornerRadius = 2
        
    }
    
    func setRadius(_ corner : CGFloat){
        layer.cornerRadius = corner
        clipsToBounds = true
    }
    var parentViewController: UIViewController? {
        for responder in sequence(first: self, next: { $0.next }) {
            if let viewController = responder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
func gradient(size:CGSize,color:[UIColor]) -> UIImage?{
      //turn color into cgcolor
      let colors = color.map{$0.cgColor}
      //begin graphics context
      UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
      guard let context = UIGraphicsGetCurrentContext() else {
          return nil
      }
      // From now on, the context gets ended if any return happens
      defer {UIGraphicsEndImageContext()}
      //create core graphics context
      let locations:[CGFloat] = [0.0,1.0]
      guard let gredient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as NSArray as CFArray, locations: locations) else {
          return nil
      }
      //draw the gradient
      context.drawLinearGradient(gredient, start: CGPoint(x:0.0,y:size.height), end: CGPoint(x:size.width,y:size.height), options: [])
      // Generate the image (the defer takes care of closing the context)
      return UIGraphicsGetImageFromCurrentImageContext()
  }
    
   
    
    func drawDottedLineGray(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineDashPattern = [3, 3] // 7 is the length of dash, 3 is length of the gap.
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }
    
    func setGradientBackground(colorOne:UIColor, colorTwo:UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setMultipleGradientBackground(colorOne:UIColor, colorTwo:UIColor,colorThree:UIColor, colorFour:UIColor){
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor,colorThree.cgColor, colorFour.cgColor]
        gradientLayer.locations = [0.0, 0.2, 0.4, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
      func applyGradient(colors: [CGColor]) {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
          gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.bounds
            self.layer.insertSublayer(gradientLayer, at: 0)
        }

        
    }


    extension UITextField {
        func setAttributedPlaceholder(placeHolder: String, color: UIColor) {
            let attributesDictionary = [NSAttributedString.Key.foregroundColor: color]
            self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: attributesDictionary)
        }
    }


extension UIButton {
    func loadingIndicator(_ show: Bool) {
        let tag = 808404
        if show {
            self.isEnabled = false
            self.alpha = 0.5
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            self.isEnabled = true
            self.alpha = 1.0
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
}

extension URL {

    func appendingQueryItem(_ queryItem: String, value: String?) -> URL {

        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }

        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)

        // Append the new query item in the existing query items array
        queryItems.append(queryItem)

        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems

        // Returns the url from new url components
        return urlComponents.url!
    }
}
