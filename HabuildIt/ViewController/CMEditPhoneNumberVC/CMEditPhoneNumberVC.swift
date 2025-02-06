//
//  CMEditPhoneNumberVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import UIKit
protocol UpdateContact {
    func updateProfileContact(phone: String)
}
class CMEditPhoneNumberVC: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textFieldContact: UITextField!
    @IBOutlet weak var buttonChangeContact: UIButton!
    @IBOutlet weak var viewContact: UIView!
    
    var delegate: UpdateContact?
    var viewModel : EditContactViewModel!
    var phone: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupViewModel()
        // Do any additional setup after loading the view.
    }
    
    func setupViewModel()
    {
        viewModel = EditContactViewModel()
        subscribeResponseObserver()
    }
    func initialSetup(){
        viewContact.makeRoundCorner(15)
        buttonChangeContact.makeRoundCorner(15)
        textFieldContact.keyboardType = .numberPad
        textFieldContact.delegate = self
        self.textFieldContact.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textFieldContact.text = phone
        
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        textFieldContact.text?.applyPatternOnNumbers(pattern: "###-###-####", replacmentCharacter: "#")
        
        
    }
    
    
    func subscribeResponseObserver()
    {
        viewModel.response.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponse(model: data)
            case .failure(let error):
                self?.handleFailure(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponse(model: CommonResponseModel) {
      print("LoginResponseModel",model)
        self.view.endEditing(true)
        kUserDefaults.setUserPhoneNumber(contact: self.textFieldContact.text ?? "")
        self.delegate?.updateProfileContact(phone: self.textFieldContact.text ?? "")
        DisplayBanner.infoBanner(message: "Phone Number Updated Successfully")
        self.popViewController()
    }
}
extension String {
    func applyPatternOnNumbers(pattern: String, replacmentCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(encodedOffset: index)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacmentCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}
