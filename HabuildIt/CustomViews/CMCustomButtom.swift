//
//  CMCustomButtom.swift
//  CircleOnlineMarketing
//
//  Created by Zakir Khan on 08/02/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//

import Foundation
import UIKit

class CMCustomButtom: UIButton {
    
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
            self.backgroundColor = Constants.Color.appDefaultBlue
            self.setTitleColor(UIColor.white, for: .normal)
            self.makeRoundCorner(5)
        }
        
        if self.tag == 2 {
            self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor(named: "561D59"), for: .normal)
            self.makeRoundCorner(5)
        }
        if self.tag == 3 {
            self.backgroundColor = Constants.Color.appDefaultWhite
                   self.setTitleColor(UIColor.lightGray, for: .normal)
                   self.makeRoundCorner(5)
               }
        if self.tag == 4 {
        //self.backgroundColor = Constants.Color.appDefaultWhite
               self.setTitleColor(UIColor.white, for: .normal)
               self.makeRoundCorner(5)
           }
        if self.tag == 5 {
        //self.backgroundColor = Constants.Color.appDefaultWhite
               self.setTitleColor(UIColor.black, for: .normal)
               self.makeRoundCorner(5)
           }
        if self.tag == 6 {
        //self.backgroundColor = Constants.Color.appDefaultWhite
               self.setTitleColor(UIColor.black, for: .normal)
               self.makeRoundCorner(5)
           }
        if self.tag == 7 {
       // self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.white, for: .normal)
            self.makeRoundCorner(5)
           }
        if self.tag == 8 {
            self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.darkGray, for: .normal)
            self.makeRoundCorner(28)
            self.makeBorder(0.5, color: UIColor(named:  "561D59")!)
        }
        if self.tag == 9 {
            self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.darkGray, for: .normal)
            
        }
        if self.tag == 10 {
            self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.darkGray, for: .normal)
            
        }
        if self.tag == 11 {
            self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.darkGray, for: .normal)
            self.makeRounded()
            
            
        }
        if self.tag == 12 {
            // self.backgroundColor = Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.white, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 13 {
            //  self.backgroundColor = UIColor.lightText //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.white, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 14 {
           
              self.addShadowWithRadius(radius: 5, cornerRadius: self.frame.size.height / 2)
            
        }
        if self.tag == 15 {
            //                   self.backgroundColor = UIColor.lightText //Constants.Color.appDefaultWhite
            //                             self.setTitleColor(UIColor.black, for: .normal)
            //                       self.makeRoundCorner(5)
            
            
        }
        if self.tag == 16 {
            self.backgroundColor = UIColor.lightGray //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.black, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 17 {
            self.backgroundColor = UIColor.lightGray //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.black, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 18 {
            self.backgroundColor = UIColor.lightGray //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.black, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 19 {
            self.backgroundColor = UIColor.clear //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.darkGray, for: .normal)
            // self.makeRoundCorner(5)
            
            
        }
        if self.tag == 20 {
            //  self.backgroundColor = UIColor.lightText //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.white, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 21 {
            // self.backgroundColor = UIColor.lightText //Constants.Color.appDefaultWhite
            self.setTitleColor(UIColor.white, for: .normal)
            self.makeRoundCorner(5)
            
            
        }
        if self.tag == 22 {
            //self.titleLabel?.font = UIFont.kAppDefaultFontRegular(ofSize: 12)
        }
        if self.tag == 23 {
            self.setTitleColor(UIColor.white, for: .normal)
          //  self.roundCorners(corners: [.topRight, .bottomRight], radius: 5)
              }
        if self.tag == 24 {
            self.setTitleColor(UIColor.white, for: .normal)
          //  self.roundCorners(corners: [.topLeft, .bottomLeft], radius: 5)
        }
    }
}
