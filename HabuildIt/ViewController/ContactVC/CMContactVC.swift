//
//  CMContactVC.swift
//  HabuildIt
//
//  Created by vivek on 2024-07-21.
//

import Foundation

class CMContactVC: UIViewController  {
    
    var viewModel : CMContactViewModel!
    
    //MARK:-----------[IBOUTLETS]---------
    @IBOutlet weak var textContact:UITextView!
    @IBOutlet weak var viewAddText: GrowingTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setTextView()
        // Do any additional setup after loading the view.
        setupViewModel()
    }
    
    func setupViewModel()
    {
        viewModel = CMContactViewModel()
        subscribeResponseObserver()
    }
    
   
}
extension  CMContactVC{
    
    //MARK:-----------[IBACTIONS]---------
    
    @IBAction func buttonBackTapped(_ sender: UIButton){
        Console.log("buttonBackTapped")
        popViewController()
    }
    
    @IBAction func sendEmailButtonTapped(_ sender: UIButton) {
        Console.log("sendEmailButtonTapped")
        if   !viewAddText.text.isEmpty  {
            let message = "Hi , \(kUserDefaults.getUserName()) with emailId: \(kUserDefaults.getUserEmail()) sent you a support message: \n \(viewAddText.text ?? "")"
            viewModel.supportMail(message: message)
        }
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
    
        DisplayBanner.infoBanner(message: "We have received your query. We Will get back to you shortly")
    }
}
