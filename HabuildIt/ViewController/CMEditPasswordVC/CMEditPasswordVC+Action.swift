//
//  CMEditPasswordVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation
import Foundation
import UIKit

extension CMEditPasswordVC {
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        Console.log("buttonActionBack")
        popViewController()
        }
   
    @IBAction func buttonActionChangePassword(_ sender: UIButton) {
           Console.log("buttonActionChangePassword")
        
        if validate()
        {
            viewModel.updatePassword(uid: kUserDefaults.getUserId(), password: textFieldConfirmPassword.text?.trimmed() ?? "")
        }
           }
    
    
    func validate()->Bool
       {
           if(textFieldCurrentPassword.text == "")
           {
               DisplayBanner.failureBanner(message: "Please Input Current Password")
               return false
           }
           else if (textFieldNewPassword.text == ""){
             DisplayBanner.failureBanner(message: "Please Input New Password")
               return false
           }
           else if (textFieldConfirmPassword.text == ""){
          DisplayBanner.failureBanner(message: "Please Confirm New Password")
            return false
        }
        
        else if (textFieldNewPassword.text != textFieldConfirmPassword.text){
                 DisplayBanner.failureBanner(message: "Password doesnt't match")
                   return false
               }
        
        return true
       }
    
}
