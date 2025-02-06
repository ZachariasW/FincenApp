//
//  CMSettingsVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 05/11/23.
//

import Foundation
import UIKit
import Instructions

class CMSettingsVC: UIViewController , CoachMarksControllerDataSource,CoachMarksControllerDelegate {
    
   //MARK:-----------[OUTLETS]------------
    
        @IBOutlet weak var viewAccount: UIView!
        @IBOutlet weak var viewHeader: UIView!
        @IBOutlet weak var labelUsername: UILabel!
        @IBOutlet weak var labelUserContact: UILabel!
        @IBOutlet weak var labelEmailId: UILabel!
        @IBOutlet weak var labelPassword: UILabel!
        @IBOutlet weak var labelContact: UILabel!
        @IBOutlet weak var buttonChangeContact: UIButton!
        @IBOutlet weak var buttonChangeUsername: UIButton!
        @IBOutlet weak var buttonChangePassword: UIButton!
        
    
        @IBOutlet weak var viewPreferences: UIView!
        @IBOutlet weak var labelHelpCenter: UILabel!
        @IBOutlet weak var labelNotification: UILabel!
        @IBOutlet weak var labelTermsOfServices: UILabel!
        @IBOutlet weak var labelPrivacyPolicy: UILabel!
        @IBOutlet weak var buttonPrivacyPolicy: UIButton!
        @IBOutlet weak var buttonHelpCenter: UIButton!
        @IBOutlet weak var buttonTermsOfService: UIButton!
        @IBOutlet weak var buttonNotification: UIButton!
        @IBOutlet weak var buttonContact: UIButton!
        @IBOutlet weak var buttonReminder: UIButton!
        @IBOutlet weak var buttonShareApp: UIButton!
        @IBOutlet weak var buttonTutorial: UIButton!
        @IBOutlet weak var btnReviewApp: UIButton!
        @IBOutlet weak var checkImage: UIImageView!

    
    @IBOutlet weak var btnFoam: UIButton!
    @IBOutlet weak var btnPasscode: UIButton!
    @IBOutlet weak var buttonLogout: UIButton!
    @IBOutlet weak var buttonTerminate: UIButton!
    var coachMarksController = CoachMarksController()
    let story = "Please use the Contact Us option if you have any questions or concerns."
    
    var viewModel : CMSettingViewModel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            DispatchQueue.main.async {
                self.setData()

            }
//            setButton()
            setView()
            setupViewModel()
         
            // Do any additional setup after loading the view.
        }
     
//        func setButton(){
//            buttonLogout.addShadowWithRadius(radius: 5, cornerRadius: 2)
//            buttonTerminate.addShadowWithRadius(radius: 5, cornerRadius: 2)
//            buttonTutorial.makeRoundCorner(8)
//        }
        func setView(){
            viewAccount.addShadowWithRadius(radius: 5, cornerRadius: 5)
            coachMarksController.overlay.isUserInteractionEnabled = true
            self.coachMarksController.dataSource = self
            viewPreferences.addShadowWithRadius(radius: 5, cornerRadius: 5)
            
        }
      
        func setData(){
            labelUsername.text = kUserDefaults.getUserName()
            labelEmailId.text = kUserDefaults.getUserEmail()
            labelUserContact.text = kUserDefaults.getUserPhoneNumber()
            // labelPassword.text = kUserDefaults.getUserPassword()
        }
    @objc func handlePurchaseNotification(_ notification: Notification) {
       
           DisplayBanner.successBanner(message: "Restore Purchase Successful")
        }
    func writeReview(){
        let productURL = URL(string: "https://itunes.apple.com/app/id958625272")
        // 1.
        var components = URLComponents(url: productURL!, resolvingAgainstBaseURL: false)

        // 2.
        components?.queryItems = [
          URLQueryItem(name: "action", value: "write-review")
        ]

        // 3.
        guard let writeReviewURL = components?.url else {
          return
        }

        // 4.
        UIApplication.shared.open(writeReviewURL)

    }
    
    
    @IBAction func tappedFoam(_ sender: Any) {
    let vc = CMFoamVC.instantiate(fromAppStoryboard: .homeTabBar)
             vc.hidesBottomBarWhenPushed = true
    navigationController?.pushViewController(vc, animated: true)
    }
    
  
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

        if !kUserDefaults.getKtutorial4()
        {
            startInstructions()
            kUserDefaults.setKtutorial4(kTutorial: true)
        }
        }
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)

          coachMarksController.stop(immediately: true)
      }

      func startInstructions() {
          coachMarksController.start(in: .window(over: self))
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
        return coachMarksController.helper.makeCoachMark(for: buttonContact)
    }
    
    
    func setupViewModel()
    {
        viewModel = CMSettingViewModel()
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
                self?.handleError(error: error)
            case .none:
                Console.log("none")
            }
            
        }
    }
    
    func handleResponse(model: CommonResponseModel) {
     
        if kUserDefaults.getOpt() {
            checkImage.image = UIImage(systemName: "checkmark.circle.fill")
            DisplayBanner.successBanner(message: "You will receive sms updates from Habuildit")
        }
        else
        {
            checkImage.image = UIImage(systemName: "circle")
            DisplayBanner.successBanner(message: "You successfully opt out sms from Habuildit")
        }
    }
    
    func handleError(error: Error?) {
     
    }
    
    
    }

    
extension CMSettingsVC: UpdateProfile {
    func updateProfile(userName: String) {
        Constants.userDefaults.set(userName, forKey: UserDefaultKeys.kUsername)
        setData()
    }
}
extension CMSettingsVC: UpdateProfilePassword {
    func updateProfilePassword(pass: String) {
        Constants.userDefaults.set(pass, forKey: UserDefaultKeys.kPassword)
        setData()
    }
}
extension CMSettingsVC: UpdateContact {
    func updateProfileContact(phone: String) {
        Constants.userDefaults.set(phone, forKey: UserDefaultKeys.kPhoneNumber)
        setData()
    }
}
