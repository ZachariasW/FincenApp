//
//  CMEditProfileVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation
import UIKit

extension CMEditProfileVC {
    @IBAction func buttonActionBack(_ sender: UIButton) {
        Console.log("buttonActionBack")
        popViewController()
        }
    @IBAction func buttonActionChangeUsername(_ sender: UIButton) {
           Console.log("buttonActionChangeUsername")
        
        if validate()
                   {
            viewModel.updateUserName(uid: kUserDefaults.getUserId(), name: textFieldUsername.text?.trimmed() ?? "")
                    }
           }
   
    func validate()->Bool
       {
        if(textFieldUsername.text == "")
           {
               DisplayBanner.failureBanner(message: "Please Add UserName")
               return false
           }
           else {
               return true
           }
       }
}
