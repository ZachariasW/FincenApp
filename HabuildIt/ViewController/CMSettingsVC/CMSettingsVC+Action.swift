//
//  CMSettingsVC+Action.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//


import Foundation
import UIKit

extension CMSettingsVC {
    
    @IBAction func buttonActionBack(_ sender: UIButton) {
        Console.log("buttonActionBack")
        popViewController()
    }
    @IBAction func buttonActionChangeusername(_ sender: UIButton){
        Console.log("buttonActionChangeusername")
        let vc = CMEditProfileVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionChangeContact(_ sender: UIButton){
        Console.log("buttonActionChangeContact")
        let vc = CMEditPhoneNumberVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionChangePassword(_ sender: UIButton){
        Console.log("buttonActionChangePassword")
        let vc = CMEditPasswordVC.instantiate(fromAppStoryboard: .homeTabBar)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func buttonActionHelpCenter(_ sender: UIButton){
        Console.log("buttonActionHelpCenter")
      //  DisplayBanner.infoBanner(message: "Work In Progress")
        if kUserDefaults.getOpt() {
            showOtoOutSheet()
        }
        else
        {
            self.viewModel.didTapOptIn(userId: kUserDefaults.getUserId(), optIn: "1")
            Constants.userDefaults.setOpt(opt: true)
            DisplayBanner.successBanner(message: "You will receive sms updates from habuildit")
        }
    }
   
    @IBAction func buttonActionPrivacyPolicy(_ sender: UIButton) {
        Console.log("buttonActionPrivacyPolicy")
        let vc = CMPrivacyPolicyVC.instantiate(fromAppStoryboard: .homeTabBar)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func buttonActionTermsofService(_ sender: UIButton) {
        Console.log("buttonActionTermsofService")
        let vc = CMTermsOfServiceVC.instantiate(fromAppStoryboard: .homeTabBar)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonActionContact(_ sender: UIButton) {
        Console.log("buttonActionContact")
        let vc = CMContactVC.instantiate(fromAppStoryboard: .homeTabBar)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedPasscode(_ sender: Any) {
        
        let vc = AddRemindersVC.instantiate(fromAppStoryboard: .homeTabBar)
                 vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
   
    @IBAction func buttonActionLogout(_ sender: UIButton) {
        Console.log("buttonActionLogout")
        showLogOutSheet()
    }
    
    func showLogOutSheet() {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        cancelActionButton.setValue(Constants.Color.appDefaultGreen, forKey: "titleTextColor")
        actionSheetController.addAction(cancelActionButton)
        let saveActionButton = UIAlertAction(title: "Logout", style: .default)
        { _ in
            
            CommonUtils.logOutUser()
        }
        saveActionButton.setValue(Constants.Color.appDefaultRed, forKey: "titleTextColor")
        actionSheetController.addAction(saveActionButton)
        actionSheetController.popoverPresentationController?.sourceView = buttonLogout
        actionSheetController.popoverPresentationController?.sourceRect = buttonLogout.bounds
        DispatchQueue.main.async {
            self.present(actionSheetController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func buttonActionTerminateAccount(_ sender: UIButton){
        Console.log("buttonActionTerminateAccount")
        showTerminateSheet()
    }
    
    func showTerminateSheet() {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        cancelActionButton.setValue(Constants.Color.appDefaultGreen, forKey: "titleTextColor")
        actionSheetController.addAction(cancelActionButton)
        let saveActionButton = UIAlertAction(title: "Terminate", style: .default)
        { _ in
          //  self.requestServerTerminateAccount()
        }
        saveActionButton.setValue(Constants.Color.appDefaultRed, forKey: "titleTextColor")
        actionSheetController.addAction(saveActionButton)
        actionSheetController.popoverPresentationController?.sourceView = buttonTerminate
        actionSheetController.popoverPresentationController?.sourceRect = buttonTerminate.bounds
        DispatchQueue.main.async {
            self.present(actionSheetController, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    func logOutUser() {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
        logoutData()
    }
    func logoutData() {
        Constants.userDefaults.set("", forKey: UserDefaultKeys.kUserId)
        Constants.userDefaults.set(false, forKey: UserDefaultKeys.Klogin)
        
        let userDefaults = UserDefaults(suiteName: "isLogin")
        userDefaults!.set("", forKey: UserDefaultKeys.kUserId)
        if let rootNC = kAppDelegate.window?.rootViewController as? UINavigationController {
            let vc = CMLoginVC.instantiate(fromAppStoryboard: .registration)
            
            var viewControllers = rootNC.viewControllers
            viewControllers.insert(vc, at: 0)
            rootNC.viewControllers = viewControllers
            rootNC.popToRootViewController(animated: true)
           
        }
        
        
    }
   
   
    
    func showOtoOutSheet() {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: "Clicking ok will Opt you out of sms messages from habuildit", preferredStyle: .actionSheet)
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        cancelActionButton.setValue(Constants.Color.appDefaultGreen, forKey: "titleTextColor")
        actionSheetController.addAction(cancelActionButton)
        let saveActionButton = UIAlertAction(title: "Ok", style: .default)
        { _ in
            
            self.viewModel.didTapOptIn(userId: kUserDefaults.getUserId(), optIn: "0")
            Constants.userDefaults.setOpt(opt: false)
        }
        saveActionButton.setValue(Constants.Color.appDefaultRed, forKey: "titleTextColor")
        actionSheetController.addAction(saveActionButton)
        actionSheetController.popoverPresentationController?.sourceView = buttonLogout
        actionSheetController.popoverPresentationController?.sourceRect = buttonLogout.bounds
        DispatchQueue.main.async {
            self.present(actionSheetController, animated: true, completion: nil)
        }
        
    }
    
  
    
    
}
