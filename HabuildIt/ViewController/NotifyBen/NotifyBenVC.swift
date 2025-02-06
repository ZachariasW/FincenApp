//
//  NotifyBenVC.swift
//  HabuildIt
//
//  Created by Vivek Singh on 11/03/24.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class NotifyBenVC: UIViewController {
    
    
    //MARK:-----------[OUTLETS]----------
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var labelAddBio: UILabel!
    @IBOutlet weak var viewAddBio: GrowingTextView!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonClose: UIButton!
    var delegate : RefreshController?
    var viewModel : NotifyBenViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    func initialSetup(){
        viewMain.makeRoundCorner(5)
        buttonAdd.makeRoundCorner(5)
        setupViewModel()
    }
    
    func setupViewModel()
    {
        viewModel = NotifyBenViewModel()
        subscribeResponseObserver()
    }
    
}
extension NotifyBenVC{
    
    @IBAction func buttonActionClose(_ sender: UIButton){
        Console.log("buttonActionClose")
        Constants.userDefaults.set(false, forKey: UserDefaultKeys.kNotificationStatus)
      dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonActionAdd(_ sender: UIButton){
        Console.log("buttonActionAdd")
      if validate()
            {
          viewModel.notifyBen(uid: kUserDefaults.getUserId())
             }
    }
    
    func validate()->Bool
    {
        if(viewAddBio.text.isEmpty)
        {
            DisplayBanner.failureBanner(message: "Please Add Business Name")
            return false
        }
        else {
            return true
        }
    }
}


extension NotifyBenVC {
    
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
        Constants.userDefaults.set(false, forKey: UserDefaultKeys.kNotificationStatus)
       // self.delegate?.refresh()
        DisplayBanner.successBanner(message: "All Beneficiary Notified Succesfully")
        dismiss(animated: true, completion: nil)
    }
}
