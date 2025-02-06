//
//  CMAccountSignupVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 04/11/23.
//

import Foundation
import UIKit
import Instructions


class CMAccountSignupVC: UIViewController , CoachMarksControllerDataSource,CoachMarksControllerDelegate {
  
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirmPassword: UITextField!
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    
    
    
    var coachMarksController = CoachMarksController()
    var viewModel : SignupViewModel!
    
    let story = "Welcome to Habuildit! The main user who logs in and collects data will be referred to as the 'admin'. Please enter the setup info and press Sign up to get started."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViewModel()
    }
    
    func setup() {

        textFieldUserName.setAttributedPlaceholder(placeHolder: "Username", color: .black)
        textFieldEmail.setAttributedPlaceholder(placeHolder: "Email", color: .black)
        textFieldPassword.setAttributedPlaceholder(placeHolder: "Password", color: .black)
        textFieldConfirmPassword.setAttributedPlaceholder(placeHolder: "Confirm Password", color: .black)
        textFieldPhoneNumber.setAttributedPlaceholder(placeHolder: "Phone Number", color: .black)
        coachMarksController.overlay.isUserInteractionEnabled = true
        self.coachMarksController.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.buttonSignup.applyGradient(colors: [Constants.Color.appbuttonGradiantStart.cgColor, Constants.Color.appbuttonGradiantEnd.cgColor])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Constants.sharedAppDelegate.setSwipe(enabled: true, navigationController: navigationController)
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            startInstructions()
        }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)

          coachMarksController.stop(immediately: true)
      }

      func startInstructions() {
          coachMarksController.start(in: .window(over: self))
      }
    
    func setupViewModel()
    {
        viewModel = SignupViewModel()
        subscribeRegisterResponseObserver()
    }
    
    func subscribeRegisterResponseObserver()
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
            
            DisplayBanner.failureBanner(message: "User Name or Email already exists")
            
        }
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (any UIView & Instructions.CoachMarkBodyView), arrowView: (any UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
                withArrow: true,
                arrowOrientation: coachMark.arrowOrientation
            )

            coachViews.bodyView.hintLabel.text = story
            coachViews.bodyView.nextLabel.text = "Ok!"

            return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        return coachMarksController.helper.makeCoachMark(for: buttonSignup)
    }
    
  
    

    
}
