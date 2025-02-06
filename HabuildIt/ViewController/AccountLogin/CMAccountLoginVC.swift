//
//  CMAccountLoginVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 04/11/23.
//

import UIKit
import WebKit

class CMAccountLoginVC: UIViewController {
    
   
    var viewModel : LoginViewModel!
    
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       // textFieldUserName.setLeftViewImage(img: UIImage(named: "like")!)
       // textFieldPassword.setLeftViewImage(img: UIImage(named: "like")!)
        textFieldUserName.setAttributedPlaceholder(placeHolder: "Email or Username", color: .black)
        textFieldPassword.setAttributedPlaceholder(placeHolder: "Password", color: .black)
//        textFieldUserName.text = "Zakir12345783"
//        textFieldPassword.text = "1234567"
        setupViewModel()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.buttonLogin.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Constants.sharedAppDelegate.setSwipe(enabled: true, navigationController: navigationController)
    }
    
    func setupViewModel()
    {
        viewModel = LoginViewModel()
        subscribeLoginResponseObserver()
    }
    
    func subscribeLoginResponseObserver()
    {
        viewModel.response.observe(on: self) { [weak self] (result) in
            guard  result != nil else { return }
            switch result {
            case .success(let data):
                self?.handleResponse(model: data)
            case .failure(let error):
                self?.handleError(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponse(model: LoginResponseModel) {
      print("LoginResponseModel",model)
        if model.response?.success == "true" {
            DisplayBanner.successBanner(message: "Welcome to HabuildIt")
            kUserDefaults.set(true, forKey: UserDefaultKeys.kIsLoggedIn)
            kAppDelegate.setUserDataInUserDefault(userData: model.response?.data?.first)
            let vc = MainTabBarVC.instantiate(fromAppStoryboard: .homeTabBar)
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        else {
            
            DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
            
        }
    }
    
    func handleError(error: Error?) {
        if let error = error {
           
            DisplayBanner.failureBanner(message: "Invalid Username or Password".localized)
        }
    }
}
