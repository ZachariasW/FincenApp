//
//  PasscodeVC.swift
//  HabuildIt
//
//  Created by Harshit Rana on 06/11/23.
//

import Foundation
import UIKit
class PasscodeVC: UIViewController,UITextFieldDelegate{
    
    
    @IBOutlet var viewPasscode: [UIView]!
    
    @IBOutlet var textField1: UITextField!
    
    @IBOutlet var textField2: UITextField!
    
    @IBOutlet var textField3: UITextField!
    
    @IBOutlet var textField4: UITextField!
    
    @IBOutlet var textField5: UITextField!
    
    @IBOutlet var textField6: UITextField!
    
    @IBOutlet var textField7: UITextField!
    
    @IBOutlet var textField8: UITextField!
    
    var currentTextField: UITextField?
    
    @IBOutlet weak var buttonVerify: UIButton!
    
    
    @IBOutlet var vwP1:UIView!
    @IBOutlet var vwP2:UIView!
    @IBOutlet var vwP3:UIView!
    @IBOutlet var vwP4:UIView!
    @IBOutlet var vwP5:UIView!
    @IBOutlet var vwP6:UIView!
    @IBOutlet var vwP7:UIView!
    @IBOutlet var vwP8:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField1.becomeFirstResponder()
    }
    
    @IBAction func tappedVerify(_ sender: Any) {
        
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTextFields() {
//        vwP1.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP2.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP3.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP4.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP5.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP6.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP7.addShadowWithRadius(radius: 5, cornerRadius: 5)
//        vwP8.addShadowWithRadius(radius: 5, cornerRadius: 5)
        
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        textField7.delegate = self
        textField8.delegate = self
        textField1.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField2.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField3.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField4.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField5.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField6.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField7.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
        textField8.addTarget(self, action: #selector(self.textdidChange(textfield:)), for: UIControl.Event.editingChanged)
//        textField1.tag = 1
//        textField2.tag = 2
//        textField3.tag = 3
//        textField4.tag = 4
//        textField5.tag = 5
//        textField6.tag = 6
//        textField7.tag = 7
//        textField8.tag = 8
//        currentTextField = textField1
    }

  @objc  func textdidChange(textfield: UITextField){
        let text = textfield.text
        
        if text?.utf16.count == 1 {
            
            switch textfield {
            case textField1:
                textField2.becomeFirstResponder()
                break
                
            case textField2:
                textField3.becomeFirstResponder()
                break
                
            case textField3:
                textField4.becomeFirstResponder()
                break
                
            case textField4:
                textField5.becomeFirstResponder()
                break
                
            case textField5:
                textField6.becomeFirstResponder()
                break
                
            case textField6:
                textField7.becomeFirstResponder()
                break
                
            case textField7:
                textField8.becomeFirstResponder()
                break
                
            case textField8:
                textField8.resignFirstResponder()
                break
                
            default:
                break
            }
            
        } else if text?.utf16.count == 0 {
            switch textfield {
            case textField8:
                textField7.becomeFirstResponder()
                break
                
            case textField7:
                textField6.becomeFirstResponder()
                break
                
            case textField6:
                textField5.becomeFirstResponder()
                break
                
            case textField5:
                textField4.becomeFirstResponder()
                break
                
            case textField4:
                textField3.becomeFirstResponder()
                break
                
            case textField3:
                textField2.becomeFirstResponder()
                break
                
            case textField2:
                textField1.becomeFirstResponder()
                break
                
            case textField1:
                textField1.becomeFirstResponder()
                break
                
            default:
                break
            }
        }else{
            print("")
        }
        
    }
    
}
