//
//  ShareVC.swift
//  HabuildIt
//
//  Created by vivek on 2024-05-08.
//

import Foundation
import Foundation
import UIKit
import IQKeyboardManagerSwift

class ShareVC: UIViewController {
    
    
    //MARK:-----------[OUTLETS]----------
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var labelAddBio: UILabel!
    @IBOutlet weak var viewAddBio: GrowingTextView!
    @IBOutlet weak var viewAddContact: GrowingTextView!
    @IBOutlet weak var viewAddMobile: GrowingTextView!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var buttonEdit: UIButton!
    var delegate : RefreshController?
    var viewModel : UpdateBeneficiaryViewModel!
    var bnid = String()
    var name = String()
    var mobile = String()
    var contact = String()
    var isUpdate = false
    var bid = String()

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
        disableView()
        setupViewModel()
    }
    
    func setupViewModel()
    {
        viewModel = UpdateBeneficiaryViewModel()
        subscribeResponseObserver()
        subscribeNotifyBenObserver()
    }
    
    func enableView()
    {
        viewAddBio.isEditable = true
        viewAddMobile.isEditable = true
        viewAddContact.isEditable = true
    }
    
    func disableView()
    {
        viewAddBio.isEditable = false
        viewAddMobile.isEditable = false
        viewAddContact.isEditable = false
    }
    
}

extension ShareVC {
    
    @IBAction func buttonActionClose(_ sender: UIButton){
        Console.log("buttonActionClose")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonActionAdd(_ sender: UIButton){
        Console.log("buttonActionAdd")
        
        viewModel.notifyInBen(uid: kUserDefaults.getUserId(), bid: bid, bnid: bnid)
//                   let textToShare = "Fincen compliance documents to update. \n Please click the link and fill out the form, thank you"
//        
//                let urlString = "https://habuildit.com/ben/" + (bnid) + "/" + bid + "/" + kUserDefaults.getUserId()
//        
//                let myWebsite = URL(string: urlString)
//                let objectsToShare = [textToShare, myWebsite!,  #imageLiteral(resourceName: "logoImage")] as [Any]
//                       let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//        
//                       //Excluded Activities
//                       activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList,UIActivity.ActivityType.assignToContact,UIActivity.ActivityType.mail ]
//                       //
//        
//                       activityVC.popoverPresentationController?.sourceView = sender
//                       self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func buttonActionEdit(_ sender: UIButton){
        Console.log("buttonActionAdd")
        
        if isUpdate
        {
            if validate()
            {
                viewModel.editBeneficiary(bnid: bnid, name: viewAddBio.text, contact: viewAddContact.text,mobile: viewAddMobile.text)
            }
            disableView()
            isUpdate = false
            buttonEdit.setTitle("Edit", for: .normal)
        }
        
        else
        {
            isUpdate = true
            enableView()
            buttonEdit.setTitle("Update", for: .normal)
        }
       
    }
    
    func validate()->Bool
    {
        if viewAddBio.text == "" || viewAddBio.text!.isEmpty {
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


extension ShareVC {
    
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
       // DisplayBanner.infoBanner(message: "Beneficiary Updated Successfully")
        BannerManager.shared.showBanner(message: "Beneficiary Updated Successfully", type: .success)
    }
    
    func subscribeNotifyBenObserver()
    {
        viewModel.responseNotify.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponseNotify(model: data)
            case .failure(let error):
                self?.handleFailure(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponseNotify(model: CommonResponseModel) {
        print("LoginResponseModel",model)
        self.delegate?.refresh()
        BannerManager.shared.showBanner(message: "Update form sent", type: .success)
    }
}
