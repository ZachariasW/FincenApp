//
//  CMEditPasswordVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import UIKit

protocol UpdateProfilePassword {
    func updateProfilePassword(pass: String)
}
class CMEditPasswordVC: UIViewController {
    
    
    @IBOutlet weak var textFieldCurrentPassword: UITextField!
    @IBOutlet weak var textFieldNewPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var buttonChangePassword: UIButton!
    @IBOutlet weak var viewPassword: UIView!
    
    var delegate: UpdateProfilePassword?
    var currentPassword = UserDefaultKeys.kPassword
    var viewModel : EditPasswordViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        setupViewModel()
        // Do any additional setup after loading the view.
    }
    func initialSetup(){
        viewPassword.makeRoundCorner(15)
        buttonChangePassword.makeRoundCorner(15)
        
    }
    
    func setupViewModel()
    {
        viewModel = EditPasswordViewModel()
        subscribeResponseObserver()
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
        if model.response?.success == "true"
        {
         
            BannerManager.shared.showBanner(message: "Password are updated successfully", type: .success)
            popViewController()
        }
       
    }
}
