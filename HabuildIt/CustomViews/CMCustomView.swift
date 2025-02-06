//
//  CMCustomView.swift
//  CircleOnlineMarketing
//
//  Created by Zakir Khan on 08/02/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//

import Foundation
import UIKit

class CMCustomView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        if self.tag == 1 {
            self.makeRounded()
            self.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
           
        }
        if self.tag == 2 {
            self.makeRounded()
        }
        if self.tag == 3 {
            //  self.backgroundColor = Constants.Color.appDefaultGreen
            
            
        }
        if self.tag == 4 {
            self.backgroundColor =   UIColor(named: "F1F0F0")//Constants.Color.appDefaultGreen
            self.makeRoundCorner(24)
            
            
            
            
        }
        if self.tag == 5 {
            //      self.backgroundColor = Constants.Color.appDefaultGreen
            
            
        }
        if self.tag == 6 {
         
        }
        if self.tag == 7 {
//            self.backgroundColor =  UIColor.init(hexString: "#F0F0F0")
            //Constants.Color.appDefaultGreen
            self.backgroundColor =  UIColor(named: "F4F4F4")
            self.makeRoundCorner(43)
        }
        if self.tag == 8 {
            self.backgroundColor =  UIColor.clear  //Constants.Color.appDefaultGreen
            //  self.makeRoundCorner(28)
            
        }
        if self.tag == 9 {
            self.backgroundColor =  UIColor.clear   //Constants.Color.appDefaultGreen
            //    self.makeRoundCorner(28)
            
        }
        if self.tag == 10 {
            self.backgroundColor =  UIColor.lightGray  //Constants.Color.appDefaultGreen
            self.makeRoundCorner(28)
            
        }
    }
    
    
}
