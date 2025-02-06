//
//  UpdateBeneficiaryVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 27/12/23.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class UpdateBeneficiaryVC: UIViewController {
    
    
    //MARK:-----------[OUTLETS]----------
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var labelAddBio: UILabel!
    @IBOutlet weak var viewAddBio: GrowingTextView!
    @IBOutlet weak var viewAddContact: GrowingTextView!
    @IBOutlet weak var viewAddMobile: GrowingTextView!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    var delegate : RefreshController?
    var viewModel : UpdateBeneficiaryViewModel!
    var bnid = String()
    var name = String()
    var mobile = String()
    var contact = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    func initialSetup(){
        viewMain.makeRoundCorner(5)
        buttonAdd.makeRoundCorner(5)
        viewAddBio.text = name
        viewAddMobile.text = mobile
        viewAddContact.text = contact
        setupViewModel()
    }
    
    func setupViewModel()
    {
        viewModel = UpdateBeneficiaryViewModel()
        subscribeResponseObserver()
    }
    
}
extension UpdateBeneficiaryVC{
    
    @IBAction func buttonActionClose(_ sender: UIButton){
        Console.log("buttonActionClose")
      dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonActionAdd(_ sender: UIButton){
        Console.log("buttonActionAdd")
      if validate()
            {
          viewModel.editBeneficiary(bnid: bnid, name: viewAddBio.text, contact: viewAddContact.text,mobile: viewAddMobile.text)
             }
    }
    
    func validate()->Bool
    {
        if(viewAddBio.text.isEmpty)
        {
            DisplayBanner.failureBanner(message: "Please Add Beneficiary Name")
            return false
        }
        
        else if viewAddContact.text == "" ||  viewAddContact.text!.isEmpty {
            DisplayBanner.infoBanner(message: Validation.errorEmailEmpty)
            return false
        } else if !(viewAddContact.text?.isValidEmail())! {
            DisplayBanner.infoBanner(message: Validation.errorEmailInvalid)
            return false
        }else if (viewAddMobile.text?.count)! < 8  {
            DisplayBanner.infoBanner(message: Validation.errorPhoneLength)
            return false
        }
        
        else {
            return true
        }
    }
}


extension UpdateBeneficiaryVC {
    
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
        self.delegate?.refresh()
        dismiss(animated: true, completion: nil)
    }
}
