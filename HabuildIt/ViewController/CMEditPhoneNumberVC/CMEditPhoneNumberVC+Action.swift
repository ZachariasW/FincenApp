//
//  CMEditPhoneNumberVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation
import UIKit

extension CMEditPhoneNumberVC {
    @IBAction func buttonActionBack(_ sender: UIButton) {
        Console.log("buttonActionBack")
        popViewController()
    }
    
    @IBAction func buttonActionChangeContact(_ sender: UIButton) {
        Console.log("buttonActionChangeContact")
        if validate(){
            viewModel.updateContact(uid: kUserDefaults.getUserId(), contact: textFieldContact.text?.trimmed() ?? "")

        }
    }
    
     func validate()->Bool
            {
                if(textFieldContact.text == "")
                {
                    DisplayBanner.failureBanner(message: "Please Input PhoneNumber")
                    return false
                }
             return true
            }
         
     }
