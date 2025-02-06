//
//  CMLoginVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 04/11/23.
//

import Foundation
import UIKit


extension CMLoginVC{
    
    @IBAction func buttonActionLogin(_ sender:UIButton){
        Console.log("buttonActionLogin")
        let vc = CMAccountLoginVC.instantiate(fromAppStoryboard: .registration)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionSignup(_ sender:UIButton){
        Console.log("buttonActionLogin")
        let vc = CMAccountSignupVC.instantiate(fromAppStoryboard: .registration)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionTermsAndService(_ sender:UIButton){
        Console.log("buttonActionTermsAndService")
        let vc = CMTermsOfServiceVC.instantiate(fromAppStoryboard: .homeTabBar)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
