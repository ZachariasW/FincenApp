//
//  CMLoginVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 01/11/23.
//

import Foundation
import UIKit
import AuthenticationServices

class CMLoginVC: UIViewController {
   
    var viewModel : LoginViewModel!
    
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var buttonTermsAndCondition: UIButton!
    @IBOutlet weak var stackViewSignIn: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        appleSignInFunction()
    }
    
    func setup() {
        viewModel = LoginViewModel()
        subscribeLoginResponseObserver()
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.buttonLogin.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Constants.sharedAppDelegate.setSwipe(enabled: true, navigationController: navigationController)
    }
    func appleSignInFunction(){
        if #available(iOS 13.0, *) {
            let appleSignInButton = ASAuthorizationAppleIDButton(type: .default, style: .white)
               
               appleSignInButton.translatesAutoresizingMaskIntoConstraints = false
               appleSignInButton.addTarget(self, action:  #selector(actionHandleAppleSignin), for: .touchUpInside)
               stackViewSignIn.addArrangedSubview(appleSignInButton)
           }
        
    }
    
    @objc func actionHandleAppleSignin() {
          
          if #available(iOS 13.0, *) {
              let appleIDProvider = ASAuthorizationAppleIDProvider()
         
          let request = appleIDProvider.createRequest()
          request.requestedScopes = [.fullName, .email]
          let authorizationController = ASAuthorizationController(authorizationRequests: [request])
          authorizationController.delegate = self
          authorizationController.presentationContextProvider = self
          authorizationController.performRequests()
      }
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



extension CMLoginVC : ASAuthorizationControllerDelegate , ASAuthorizationControllerPresentationContextProviding{
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("authorization error")
        guard let error = error as? ASAuthorizationError else {
            return
        }
        
        switch error.code {
        case .canceled:
            // user press "cancel" during the login prompt
            print("Canceled")
        case .unknown:
            // user didn't login their Apple ID on the device
            print("Unknown")
        case .invalidResponse:
            // invalid response received from the login
            print("Invalid Respone")
        case .notHandled:
            // authorization request not handled, maybe internet failure during login
            print("Not handled")
        case .failed:
            // authorization failed
            print("Failed")
        @unknown default:
            print("Default")
        }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let firstName = appleIDCredential.fullName?.givenName ?? ""
            let lastName = appleIDCredential.fullName?.familyName ?? ""
            let email = appleIDCredential.email ?? ""
            print(email)
            let fullName = firstName + " " + lastName
            
//            if !(firstName.isEmpty){
//
//
//
//            }
//            else {
//
//            }
//
//            let parameter: [String:Any] = [ServerKeys.name: fullName, ServerKeys.password: "123" , ServerKeys.email : email , ServerKeys.token: kUserDefaults.getDeviceToken() , ServerKeys.linkedinid : userIdentifier.stripped , ServerKeys.imgurl :"NA"]
//
//                                         self.requestServerLoginLinkedIn(parameter: parameter)

            viewModel.socialLogin(userName: fullName, password: "Hab98765432876", email: email, appleId: userIdentifier.stripped , token: Constants.userDefaults.getDeviceToken())
        print("Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))") }
            
            
            
        else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            //Navigate to other view controller
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
  
}
