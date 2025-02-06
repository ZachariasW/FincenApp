//
//  CMForgotPasswordVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 04/11/23.
//

import Foundation
import UIKit

class CMForgotPasswordVC: UIViewController {

    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
    }
    
    func setup() {
        textFieldUserName.setAttributedPlaceholder(placeHolder: "Email", color: .black)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.buttonSubmit.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
    }
}


extension CMForgotPasswordVC {
    @IBAction func buttonActionSubmit(_ sender: UIButton) {
        Console.log("buttonActionSubmit")
        if isValidate() {
           // requestServerForgotPassword()
        }
        
    }
    
    func isValidate() -> Bool {
        if (textFieldUserName.text?.trimFromLeading().isEmpty)! {
            DisplayBanner.infoBanner(message: "Please enter email address")
            return false
        }
        return true
    }
    
    @IBAction func buttonActionLogin(_ sender: UIButton) {
        Console.log("buttonActionLogin")
        popViewController()
    }
    
    @IBAction func buttonActionCreateNewAccount(_ sender: UIButton) {
        Console.log("buttonActionCreateNewAccount")
        let vc = CMAccountSignupVC.instantiate(fromAppStoryboard: .registration)
        navigationController?.pushViewController(vc, animated: true)
    }
}



