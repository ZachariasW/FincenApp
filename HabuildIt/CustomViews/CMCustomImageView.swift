//
//  CMCustoCMCustomImageViewmTextField.swift
//  CircleOnlineMarketing
//
//  Created by Zakir Khan on 08/02/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//
import Foundation
import UIKit

class CMCustomImageView: UIImageView {
    
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
           // self.makeBorder(0.8, color: .init(hexString: "#ECECEC"))
            self.setShadowWithColor()
        }else if self.tag == 2 {
            self.makeRounded()
            self.makeBorder(0.5, color: UIColor(named: "ECECEC")!)
        } else if self.tag == 3 {
              self.setShadowWithColor()
          //  self.makeRounded()
        }else if self.tag == 4 {
            self.makeRoundCorner(6)
        }
        else if self.tag == 5 {
          self.makeRounded()
            self.makeBorder(0.5, color: UIColor(named: "ECECEC")!)
        }else if self.tag == 6 {
          self.makeRounded()
        }
        
    }
}
