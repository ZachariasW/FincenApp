//
//  CMAccountLoginVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 04/11/23.
//


import Foundation
import UIKit
import WebKit

extension CMAccountLoginVC {
    @IBAction func buttonActionSignup(_ sender: UIButton) {
        Console.log("buttonActionSignup")
        let vc = CMAccountSignupVC.instantiate(fromAppStoryboard: .registration)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionLogin(_ sender: UIButton) {
        Console.log("buttonActionLogin")
        if isValidate() {

            requestServerLogin()
        }
        
        
        
    }
    @IBAction func buttonActionLoginLinkedIn(_ sender: UIButton) {
        Console.log("buttonActionLoginLinkedIn")
       
     //   DisplayBanner.infoBanner(message: "Hey, go to profile and settings to create your account username.")
    }
    
    
    @IBAction func buttonActionForgotPassword(_ sender: UIButton) {
           Console.log("buttonActionForgotPassword")
           let vc = CMForgotPasswordVC.instantiate(fromAppStoryboard: .registration)
           navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        Console.log("buttonActionBack")
        popViewController()
    }
    
    func isValidate() -> Bool {
        if (textFieldUserName.text?.trimFromLeading().isEmpty)! {
           DisplayBanner.infoBanner(message: Validation.errorUsernameEmail)
            return false
        }  else if (textFieldPassword.text?.trimFromLeading().isEmpty)! {
           DisplayBanner.infoBanner(message: Validation.errorPasswordEmpty)
            return false
        }
        return true
    }
    
    func requestServerLogin(){
        viewModel.didTapLogin(userName: textFieldUserName.text!, password: textFieldPassword.text!, token: Constants.userDefaults.getDeviceToken() )
       
    }
    
}



