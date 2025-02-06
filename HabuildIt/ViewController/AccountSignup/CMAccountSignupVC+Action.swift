//
//  CMAccountSignupVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 04/11/23.
//

import Foundation
import Foundation
import UIKit

extension CMAccountSignupVC {
    @IBAction func buttonActionLogin(_ sender: UIButton) {
        Console.log("buttonActionLogin")
        popViewController()
    }
    
    @IBAction func buttonActionSignup(_ sender: UIButton) {
        Console.log("buttonActionSignup")
        if isValidate() {
            viewModel.didTapRegister(userName: textFieldUserName.text!, email: textFieldEmail.text!, password: textFieldPassword.text!, mobile: textFieldPhoneNumber.text!, token: Constants.userDefaults.getDeviceToken())
        }
        
    }
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        Console.log("buttonActionBack")
        popViewController()
    }
    
    func isValidate() -> Bool {
        if textFieldUserName.text == "" ||  textFieldUserName.text!.isEmpty {
            DisplayBanner.infoBanner(message: Validation.errorUsername)
            return false
        } else if textFieldEmail.text == "" ||  textFieldEmail.text!.isEmpty {
            DisplayBanner.infoBanner(message: Validation.errorEmailEmpty)
            return false
        } else if !(textFieldEmail.text?.isValidEmail())! {
            DisplayBanner.infoBanner(message: Validation.errorEmailInvalid)
            return false
        }else if (textFieldPhoneNumber.text?.count)! < 8  {
            DisplayBanner.infoBanner(message: Validation.errorPhoneLength)
            return false
        }
        else if textFieldPassword.text == "" ||  textFieldPassword.text!.isEmpty {
            DisplayBanner.infoBanner(message: Validation.errorPasswordEmpty)
            return false
        }
        else if (textFieldPassword.text?.count)! < 8 || (textFieldPassword.text?.count)! > 20  {
            if (textFieldPassword.text?.count)! > 20  {
                DisplayBanner.infoBanner(message: Validation.errorPasswordInvalid)
                return false
            } else if (textFieldPassword.text?.count)! < 8  {
                DisplayBanner.infoBanner(message: Validation.errorPasswordInvalid)
                return false
            }
            return false
        } else if textFieldConfirmPassword.text == "" ||  textFieldConfirmPassword.text!.isEmpty {
            DisplayBanner.infoBanner(message: Validation.errorEnterConfirmPassword)
            return false
        } else if (textFieldConfirmPassword.text! != textFieldPassword.text!) {
            DisplayBanner.infoBanner(message: Validation.errorPasswordMismatch)
            return false
        }
        return true
    }
    
}
