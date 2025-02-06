//
//  CMEditProfileVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 15/11/23.
//

import Foundation
import UIKit
protocol UpdateProfile {
    func updateProfile(userName: String)
}
class CMEditProfileVC: UIViewController {
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var buttonChangeUsername: UIButton!
    @IBOutlet weak var viewUsername: UIView!
    
    var delegate: UpdateProfile?
    var viewModel : UserNameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        //requestServerUpdateUsername()
        // Do any additional setup after loading the view.
    }
    func initialSetup(){
        viewUsername.makeRoundCorner(15)
        buttonChangeUsername.makeRoundCorner(15)
        setupViewModel()
        
    }
    
    func setupViewModel()
    {
        viewModel = UserNameViewModel()
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
        self.view.endEditing(true)
        kUserDefaults.setUserName(userName: self.textFieldUsername.text ?? "")
        self.delegate?.updateProfile(userName: self.textFieldUsername.text ?? "")
        DisplayBanner.infoBanner(message: "UserName Updated Successfully")
        self.popViewController()
    }
}

