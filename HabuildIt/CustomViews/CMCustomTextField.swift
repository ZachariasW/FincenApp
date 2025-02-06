//
//  CMCustomTextField.swift
//  CircleOnlineMarketing
//
//  Created by Zakir Khan on 08/02/20.
//  Copyright © 2020 binateBitsInfotech. All rights reserved.
//


import Foundation
import UIKit

class CMCustomTextField: UITextField {
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
            self.backgroundColor = Constants.Color.appDefaultGreen
            
        }else if tag == 2 {
            self.textColor = .black
            self.font = UIFont.kAppDefaultFontRegular(ofSize: 14)
            borderStyle = .none

        }
    }
}

